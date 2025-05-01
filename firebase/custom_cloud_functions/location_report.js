const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

// API keys
const GOOGLE_GEOCODING_API_KEY = "AIzaSyBNFc7xKlqh4eb6fmYBTEhWmZQUYt1Uf4g";
const GOOGLE_PLACES_API_KEY = "AIzaSyBNFc7xKlqh4eb6fmYBTEhWmZQUYt1Uf4g";
const GOOGLE_DISTANCE_MATRIX_API_KEY =
  "AIzaSyBNFc7xKlqh4eb6fmYBTEhWmZQUYt1Uf4g";
const CENSUS_API_KEY = "1a221a1d98a1b098abffebdb4646c9b231857a9e";
const WALKSCORE_API_KEY = "d200c7dc7773e804d218efdaebefcb93";
const LOOPNET_API_KEY = "301ef7a2f3msh4c7189049e65c5ep1b0177jsn59cb16e3350b";
const GPT_API_KEY =
  "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";

// API endpoints
const GEOCODE_API_URL = "https://maps.googleapis.com/maps/api/geocode/json";
const CENSUS_API_URL = "https://api.census.gov/data/2019/acs/acs5";
const PLACES_API_URL =
  "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
const DISTANCE_MATRIX_API_URL =
  "https://maps.googleapis.com/maps/api/distancematrix/json";
const WALKSCORE_API_URL = "https://api.walkscore.com/score";
const LOOPNET_API_URL = "https://loopnet.p.rapidapi.com/listings/search";

exports.locationReport = functions.https.onCall(async (data, context) => {
  try {
    const address = data.address;
    if (!address) {
      return { error: "Address parameter is required." };
    }

    // Step 1: Geocode the address
    const geocodeResponse = await axios.get(GEOCODE_API_URL, {
      params: { address, key: GOOGLE_GEOCODING_API_KEY },
    });
    const { lat, lng } = geocodeResponse.data.results[0].geometry.location;

    // Step 2: Fetch Census Data (Population, Age, Ethnicity, Income)
    const censusResponse = await axios.get(CENSUS_API_URL, {
      params: {
        get: "B01003_001E,B01002_001E,B03002_003E,B03002_012E,B03002_006E,B03002_009E,B19001_001E,B19001_002E,B19001_012E,B19001_017E,B19001_015E",
        for: `zip code tabulation area:*`,
        key: CENSUS_API_KEY,
      },
    });
    const censusData = parseCensusData(censusResponse.data);

    // Step 3: Fetch Nearby Competitors
    const placesResponse = await axios.get(PLACES_API_URL, {
      params: {
        location: `${lat},${lng}`,
        radius: 1500,
        type: "restaurant",
        key: GOOGLE_PLACES_API_KEY,
      },
    });
    const competitors = parseCompetitors(placesResponse.data);

    // Step 4: Fetch Walk Score and Transit
    const walkscoreResponse = await axios.get(WALKSCORE_API_URL, {
      params: {
        lat,
        lon: lng,
        address,
        format: "json",
        wsapikey: WALKSCORE_API_KEY,
      },
    });

    // Step 5: Fetch Nearby Commercial Properties (LoopNet)
    const loopnetResponse = await axios.get(LOOPNET_API_URL, {
      params: {
        latitude: lat,
        longitude: lng,
        radius: 5,
        assetType: "retail",
        limit: 4,
      },
      headers: {
        "X-RapidAPI-Host": "loopnet.p.rapidapi.com",
        "X-RapidAPI-Key": LOOPNET_API_KEY,
      },
    });
    const properties = parseProperties(loopnetResponse.data);

    // Step 6: Generate Descriptions and Scores using GPT-4
    const populationAnalysisDesc = await generateGPTDescription(
      "Describe the population characteristics based on recent census data",
      censusData,
    );
    const parkingAvailabilityDesc = await generateGPTDescription(
      "Describe parking availability based on the Walk Score data",
      walkscoreResponse.data,
    );
    const transitAvailabilityDesc = await generateGPTDescription(
      "Summarize transit options and availability based on Walk Score data",
      walkscoreResponse.data,
    );

    const locationScore = await generateGPTScore(
      "Calculate a location score from 0 to 100 based on census and walk score data. Only return a single integer.",
      { censusData, walkscoreData: walkscoreResponse.data },
    );

    // Compile final report data
    const report = {
      locationScore: locationScore,
      populationAnalysis: {
        score: await generateGPTScore(
          "Provide a population score from 0 to 100 based on census data. Only return a single integer.",
          censusData,
        ),
        description: populationAnalysisDesc,
      },
      demographicBreakdown: {
        score: await generateGPTScore(
          "Provide a demographic score from 0 to 100 based on ethnicity and income data. Only return a single integer.",
          censusData,
        ),
        ethnicity: censusData.ethnicity,
      },
      competitorInsights: {
        score: await generateGPTScore(
          "Provide a competitor score from 0 to 100 based on proximity and ratings of nearby restaurants. Only return a single integer.",
          competitors,
        ),
        competitors,
      },
      parkingAvailability: {
        score: await generateGPTScore(
          "Provide a parking score from 0 to 100 based on Walk Score data for parking. Only return a single integer.",
          walkscoreResponse.data,
        ),
        description: parkingAvailabilityDesc,
      },
      transitAvailability: {
        score: await generateGPTScore(
          "Provide a transit availability score from 0 to 100 based on Walk Score transit data. Only return a single integer.",
          walkscoreResponse.data,
        ),
        description: transitAvailabilityDesc,
      },
      additionalData: {
        currentPopulation: censusData.currentPopulation,
        medianAge: censusData.medianAge,
        ethnicityMix: censusData.ethnicity,
        householdIncome: censusData.householdIncome,
        populationChange: generateMonthlyPopulationChange(
          censusData.currentPopulation,
        ),
      },
      nearbyProperties: properties,
    };

    return report;
  } catch (error) {
    return { error: "Failed to generate location report." };
  }
});

// Helper functions (parsers, scorers, and GPT calls)

function parseCensusData(data) {
  const [
    _,
    population,
    medianAge,
    white,
    latino,
    asian,
    multiracial,
    incomeTotal,
    incomeBelow40k,
    income40kTo60k,
    income60kTo80k,
    incomeAbove80k,
  ] = data[1];
  const ethnicity = { white, latino, asian, multiracial };
  const householdIncome = {
    "0-40000": Math.round((incomeBelow40k / incomeTotal) * 100),
    "40001-60000": Math.round((income40kTo60k / incomeTotal) * 100),
    "60001-80000": Math.round((income60kTo80k / incomeTotal) * 100),
    "80001+": Math.round((incomeAbove80k / incomeTotal) * 100),
  };
  return {
    currentPopulation: population,
    medianAge,
    ethnicity,
    householdIncome,
  };
}

function parseCompetitors(data) {
  return data.results.map((place) => ({
    name: place.name,
    rating: place.rating || 0,
    distance: place.distance || "N/A",
  }));
}

function parseProperties(data) {
  return data.listings.map((property) => ({
    name: property.title,
    distance: property.distance || "N/A",
    squareFootage: property.size || "N/A",
  }));
}

async function generateGPTDescription(prompt, data) {
  const response = await axios.post(
    GPT_API_URL,
    {
      model: "gpt-4",
      prompt: `${prompt}: ${JSON.stringify(data)}. Only provide a detailed, relevant description without extraneous words.`,
      max_tokens: 150,
    },
    {
      headers: { Authorization: `Bearer ${GPT_API_KEY}` },
    },
  );
  return response.data.choices[0].text.trim();
}

async function generateGPTScore(prompt, data) {
  const response = await axios.post(
    GPT_API_URL,
    {
      model: "gpt-4",
      prompt: `${prompt}: ${JSON.stringify(data)}. Only return a single integer between 0 and 100.`,
      max_tokens: 10,
    },
    {
      headers: { Authorization: `Bearer ${GPT_API_KEY}` },
    },
  );
  return parseInt(response.data.choices[0].text.trim());
}

function generateMonthlyPopulationChange(currentPopulation) {
  // Generates synthetic population change data for 12 months
  const populationChange = [];
  let monthPopulation = currentPopulation;

  for (let i = 0; i < 12; i++) {
    // Apply a small random fluctuation to simulate monthly change
    const change = Math.round(monthPopulation * (Math.random() * 0.02 - 0.01)); // -1% to +1%
    monthPopulation += change;
    populationChange.push(monthPopulation);
  }
  return populationChange;
}
