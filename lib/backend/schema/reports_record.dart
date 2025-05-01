import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "adress" field.
  LatLng? _adress;
  LatLng? get adress => _adress;
  bool hasAdress() => _adress != null;

  // "adressStr" field.
  String? _adressStr;
  String get adressStr => _adressStr ?? '';
  bool hasAdressStr() => _adressStr != null;

  // "generated" field.
  bool? _generated;
  bool get generated => _generated ?? false;
  bool hasGenerated() => _generated != null;

  // "saved" field.
  bool? _saved;
  bool get saved => _saved ?? false;
  bool hasSaved() => _saved != null;

  // "population" field.
  int? _population;
  int get population => _population ?? 0;
  bool hasPopulation() => _population != null;

  // "populationData" field.
  PopulationDataStruct? _populationData;
  PopulationDataStruct get populationData =>
      _populationData ?? PopulationDataStruct();
  bool hasPopulationData() => _populationData != null;

  // "populationChanges" field.
  PopulationChangesStruct? _populationChanges;
  PopulationChangesStruct get populationChanges =>
      _populationChanges ?? PopulationChangesStruct();
  bool hasPopulationChanges() => _populationChanges != null;

  // "ethnicComposition" field.
  EthnicCompositionStruct? _ethnicComposition;
  EthnicCompositionStruct get ethnicComposition =>
      _ethnicComposition ?? EthnicCompositionStruct();
  bool hasEthnicComposition() => _ethnicComposition != null;

  // "householdIncome" field.
  HouseholdIncomeStruct? _householdIncome;
  HouseholdIncomeStruct get householdIncome =>
      _householdIncome ?? HouseholdIncomeStruct();
  bool hasHouseholdIncome() => _householdIncome != null;

  // "crimeData" field.
  CrimeDataStruct? _crimeData;
  CrimeDataStruct get crimeData => _crimeData ?? CrimeDataStruct();
  bool hasCrimeData() => _crimeData != null;

  // "crimeScore" field.
  int? _crimeScore;
  int get crimeScore => _crimeScore ?? 0;
  bool hasCrimeScore() => _crimeScore != null;

  // "crimeReport" field.
  String? _crimeReport;
  String get crimeReport => _crimeReport ?? '';
  bool hasCrimeReport() => _crimeReport != null;

  // "demographicScore" field.
  int? _demographicScore;
  int get demographicScore => _demographicScore ?? 0;
  bool hasDemographicScore() => _demographicScore != null;

  // "populationScore" field.
  int? _populationScore;
  int get populationScore => _populationScore ?? 0;
  bool hasPopulationScore() => _populationScore != null;

  // "populationReport" field.
  String? _populationReport;
  String get populationReport => _populationReport ?? '';
  bool hasPopulationReport() => _populationReport != null;

  // "parkingScore" field.
  int? _parkingScore;
  int get parkingScore => _parkingScore ?? 0;
  bool hasParkingScore() => _parkingScore != null;

  // "parkingReport" field.
  String? _parkingReport;
  String get parkingReport => _parkingReport ?? '';
  bool hasParkingReport() => _parkingReport != null;

  // "transitScore" field.
  int? _transitScore;
  int get transitScore => _transitScore ?? 0;
  bool hasTransitScore() => _transitScore != null;

  // "transitReport" field.
  String? _transitReport;
  String get transitReport => _transitReport ?? '';
  bool hasTransitReport() => _transitReport != null;

  // "competitors" field.
  List<CompetitorStruct>? _competitors;
  List<CompetitorStruct> get competitors => _competitors ?? const [];
  bool hasCompetitors() => _competitors != null;

  // "locationScore" field.
  int? _locationScore;
  int get locationScore => _locationScore ?? 0;
  bool hasLocationScore() => _locationScore != null;

  // "availableProperty" field.
  List<PropertyObjectStruct>? _availableProperty;
  List<PropertyObjectStruct> get availableProperty =>
      _availableProperty ?? const [];
  bool hasAvailableProperty() => _availableProperty != null;

  // "competitorsScore" field.
  int? _competitorsScore;
  int get competitorsScore => _competitorsScore ?? 0;
  bool hasCompetitorsScore() => _competitorsScore != null;

  // "locationLat" field.
  double? _locationLat;
  double get locationLat => _locationLat ?? 0.0;
  bool hasLocationLat() => _locationLat != null;

  // "locationLng" field.
  double? _locationLng;
  double get locationLng => _locationLng ?? 0.0;
  bool hasLocationLng() => _locationLng != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "medianAge" field.
  String? _medianAge;
  String get medianAge => _medianAge ?? '';
  bool hasMedianAge() => _medianAge != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _adress = snapshotData['adress'] as LatLng?;
    _adressStr = snapshotData['adressStr'] as String?;
    _generated = snapshotData['generated'] as bool?;
    _saved = snapshotData['saved'] as bool?;
    _population = castToType<int>(snapshotData['population']);
    _populationData = snapshotData['populationData'] is PopulationDataStruct
        ? snapshotData['populationData']
        : PopulationDataStruct.maybeFromMap(snapshotData['populationData']);
    _populationChanges =
        snapshotData['populationChanges'] is PopulationChangesStruct
            ? snapshotData['populationChanges']
            : PopulationChangesStruct.maybeFromMap(
                snapshotData['populationChanges']);
    _ethnicComposition =
        snapshotData['ethnicComposition'] is EthnicCompositionStruct
            ? snapshotData['ethnicComposition']
            : EthnicCompositionStruct.maybeFromMap(
                snapshotData['ethnicComposition']);
    _householdIncome = snapshotData['householdIncome'] is HouseholdIncomeStruct
        ? snapshotData['householdIncome']
        : HouseholdIncomeStruct.maybeFromMap(snapshotData['householdIncome']);
    _crimeData = snapshotData['crimeData'] is CrimeDataStruct
        ? snapshotData['crimeData']
        : CrimeDataStruct.maybeFromMap(snapshotData['crimeData']);
    _crimeScore = castToType<int>(snapshotData['crimeScore']);
    _crimeReport = snapshotData['crimeReport'] as String?;
    _demographicScore = castToType<int>(snapshotData['demographicScore']);
    _populationScore = castToType<int>(snapshotData['populationScore']);
    _populationReport = snapshotData['populationReport'] as String?;
    _parkingScore = castToType<int>(snapshotData['parkingScore']);
    _parkingReport = snapshotData['parkingReport'] as String?;
    _transitScore = castToType<int>(snapshotData['transitScore']);
    _transitReport = snapshotData['transitReport'] as String?;
    _competitors = getStructList(
      snapshotData['competitors'],
      CompetitorStruct.fromMap,
    );
    _locationScore = castToType<int>(snapshotData['locationScore']);
    _availableProperty = getStructList(
      snapshotData['availableProperty'],
      PropertyObjectStruct.fromMap,
    );
    _competitorsScore = castToType<int>(snapshotData['competitorsScore']);
    _locationLat = castToType<double>(snapshotData['locationLat']);
    _locationLng = castToType<double>(snapshotData['locationLng']);
    _zipCode = snapshotData['zipCode'] as String?;
    _medianAge = snapshotData['medianAge'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reports')
          : FirebaseFirestore.instance.collectionGroup('reports');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reports').doc(id);

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  LatLng? adress,
  String? adressStr,
  bool? generated,
  bool? saved,
  int? population,
  PopulationDataStruct? populationData,
  PopulationChangesStruct? populationChanges,
  EthnicCompositionStruct? ethnicComposition,
  HouseholdIncomeStruct? householdIncome,
  CrimeDataStruct? crimeData,
  int? crimeScore,
  String? crimeReport,
  int? demographicScore,
  int? populationScore,
  String? populationReport,
  int? parkingScore,
  String? parkingReport,
  int? transitScore,
  String? transitReport,
  int? locationScore,
  int? competitorsScore,
  double? locationLat,
  double? locationLng,
  String? zipCode,
  String? medianAge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adress': adress,
      'adressStr': adressStr,
      'generated': generated,
      'saved': saved,
      'population': population,
      'populationData': PopulationDataStruct().toMap(),
      'populationChanges': PopulationChangesStruct().toMap(),
      'ethnicComposition': EthnicCompositionStruct().toMap(),
      'householdIncome': HouseholdIncomeStruct().toMap(),
      'crimeData': CrimeDataStruct().toMap(),
      'crimeScore': crimeScore,
      'crimeReport': crimeReport,
      'demographicScore': demographicScore,
      'populationScore': populationScore,
      'populationReport': populationReport,
      'parkingScore': parkingScore,
      'parkingReport': parkingReport,
      'transitScore': transitScore,
      'transitReport': transitReport,
      'locationScore': locationScore,
      'competitorsScore': competitorsScore,
      'locationLat': locationLat,
      'locationLng': locationLng,
      'zipCode': zipCode,
      'medianAge': medianAge,
    }.withoutNulls,
  );

  // Handle nested data for "populationData" field.
  addPopulationDataStructData(firestoreData, populationData, 'populationData');

  // Handle nested data for "populationChanges" field.
  addPopulationChangesStructData(
      firestoreData, populationChanges, 'populationChanges');

  // Handle nested data for "ethnicComposition" field.
  addEthnicCompositionStructData(
      firestoreData, ethnicComposition, 'ethnicComposition');

  // Handle nested data for "householdIncome" field.
  addHouseholdIncomeStructData(
      firestoreData, householdIncome, 'householdIncome');

  // Handle nested data for "crimeData" field.
  addCrimeDataStructData(firestoreData, crimeData, 'crimeData');

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adress == e2?.adress &&
        e1?.adressStr == e2?.adressStr &&
        e1?.generated == e2?.generated &&
        e1?.saved == e2?.saved &&
        e1?.population == e2?.population &&
        e1?.populationData == e2?.populationData &&
        e1?.populationChanges == e2?.populationChanges &&
        e1?.ethnicComposition == e2?.ethnicComposition &&
        e1?.householdIncome == e2?.householdIncome &&
        e1?.crimeData == e2?.crimeData &&
        e1?.crimeScore == e2?.crimeScore &&
        e1?.crimeReport == e2?.crimeReport &&
        e1?.demographicScore == e2?.demographicScore &&
        e1?.populationScore == e2?.populationScore &&
        e1?.populationReport == e2?.populationReport &&
        e1?.parkingScore == e2?.parkingScore &&
        e1?.parkingReport == e2?.parkingReport &&
        e1?.transitScore == e2?.transitScore &&
        e1?.transitReport == e2?.transitReport &&
        listEquality.equals(e1?.competitors, e2?.competitors) &&
        e1?.locationScore == e2?.locationScore &&
        listEquality.equals(e1?.availableProperty, e2?.availableProperty) &&
        e1?.competitorsScore == e2?.competitorsScore &&
        e1?.locationLat == e2?.locationLat &&
        e1?.locationLng == e2?.locationLng &&
        e1?.zipCode == e2?.zipCode &&
        e1?.medianAge == e2?.medianAge;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.adress,
        e?.adressStr,
        e?.generated,
        e?.saved,
        e?.population,
        e?.populationData,
        e?.populationChanges,
        e?.ethnicComposition,
        e?.householdIncome,
        e?.crimeData,
        e?.crimeScore,
        e?.crimeReport,
        e?.demographicScore,
        e?.populationScore,
        e?.populationReport,
        e?.parkingScore,
        e?.parkingReport,
        e?.transitScore,
        e?.transitReport,
        e?.competitors,
        e?.locationScore,
        e?.availableProperty,
        e?.competitorsScore,
        e?.locationLat,
        e?.locationLng,
        e?.zipCode,
        e?.medianAge
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
