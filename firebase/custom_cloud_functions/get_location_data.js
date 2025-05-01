const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const axios = require("axios");

// Replace with your Google Maps API key
const GOOGLE_MAPS_API_KEY = "AIzaSyBNFc7xKlqh4eb6fmYBTEhWmZQUYt1Uf4g";

exports.getLocationData = functions.https.onCall(async (data, context) => {
  // Retrieve the address from the request query parameters
  const address = data.address;
  if (!address) {
    return { error: "Address parameter is required" };
  }

  try {
    // URLs for Geocode and Places APIs
    const geocodeUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${GOOGLE_MAPS_API_KEY}`;

    // Extract the required data from each API response
    const geocodeData = await axios.get(geocodeUrl);

    // Check if data exists in Geocode API response
    if (!geocodeData.results || geocodeData.results.length === 0) {
      return { error: "No location found for the provided address" };
    }
    // Extract latitude, longitude, and place_id
    const location = geocodeData.results[0].geometry.location;
    // Combine the results in a single JSON response
    return {
      latitude: location.lat,
      longitude: location.lng,
    };
  } catch (error) {
    return { error: "Failed to fetch location data" };
  }
});
