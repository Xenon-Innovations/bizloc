// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CrimeDataStruct extends FFFirebaseStruct {
  CrimeDataStruct({
    int? mortalityIndex,
    int? murderIndex,
    int? forcibleRapeIndex,
    int? forcibleRobberyIndex,
    int? aggravatedAssaultIndex,
    int? burglaryIndex,
    int? larcenyIndex,
    int? motorVehicleTheftIndex,
    int? crimeIndex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mortalityIndex = mortalityIndex,
        _murderIndex = murderIndex,
        _forcibleRapeIndex = forcibleRapeIndex,
        _forcibleRobberyIndex = forcibleRobberyIndex,
        _aggravatedAssaultIndex = aggravatedAssaultIndex,
        _burglaryIndex = burglaryIndex,
        _larcenyIndex = larcenyIndex,
        _motorVehicleTheftIndex = motorVehicleTheftIndex,
        _crimeIndex = crimeIndex,
        super(firestoreUtilData);

  // "mortality_Index" field.
  int? _mortalityIndex;
  int get mortalityIndex => _mortalityIndex ?? 0;
  set mortalityIndex(int? val) => _mortalityIndex = val;

  void incrementMortalityIndex(int amount) =>
      mortalityIndex = mortalityIndex + amount;

  bool hasMortalityIndex() => _mortalityIndex != null;

  // "murder_Index" field.
  int? _murderIndex;
  int get murderIndex => _murderIndex ?? 0;
  set murderIndex(int? val) => _murderIndex = val;

  void incrementMurderIndex(int amount) => murderIndex = murderIndex + amount;

  bool hasMurderIndex() => _murderIndex != null;

  // "forcible_Rape_Index" field.
  int? _forcibleRapeIndex;
  int get forcibleRapeIndex => _forcibleRapeIndex ?? 0;
  set forcibleRapeIndex(int? val) => _forcibleRapeIndex = val;

  void incrementForcibleRapeIndex(int amount) =>
      forcibleRapeIndex = forcibleRapeIndex + amount;

  bool hasForcibleRapeIndex() => _forcibleRapeIndex != null;

  // "forcible_Robbery_Index" field.
  int? _forcibleRobberyIndex;
  int get forcibleRobberyIndex => _forcibleRobberyIndex ?? 0;
  set forcibleRobberyIndex(int? val) => _forcibleRobberyIndex = val;

  void incrementForcibleRobberyIndex(int amount) =>
      forcibleRobberyIndex = forcibleRobberyIndex + amount;

  bool hasForcibleRobberyIndex() => _forcibleRobberyIndex != null;

  // "aggravated_Assault_Index" field.
  int? _aggravatedAssaultIndex;
  int get aggravatedAssaultIndex => _aggravatedAssaultIndex ?? 0;
  set aggravatedAssaultIndex(int? val) => _aggravatedAssaultIndex = val;

  void incrementAggravatedAssaultIndex(int amount) =>
      aggravatedAssaultIndex = aggravatedAssaultIndex + amount;

  bool hasAggravatedAssaultIndex() => _aggravatedAssaultIndex != null;

  // "burglary_Index" field.
  int? _burglaryIndex;
  int get burglaryIndex => _burglaryIndex ?? 0;
  set burglaryIndex(int? val) => _burglaryIndex = val;

  void incrementBurglaryIndex(int amount) =>
      burglaryIndex = burglaryIndex + amount;

  bool hasBurglaryIndex() => _burglaryIndex != null;

  // "larceny_Index" field.
  int? _larcenyIndex;
  int get larcenyIndex => _larcenyIndex ?? 0;
  set larcenyIndex(int? val) => _larcenyIndex = val;

  void incrementLarcenyIndex(int amount) =>
      larcenyIndex = larcenyIndex + amount;

  bool hasLarcenyIndex() => _larcenyIndex != null;

  // "motor_Vehicle_Theft_Index" field.
  int? _motorVehicleTheftIndex;
  int get motorVehicleTheftIndex => _motorVehicleTheftIndex ?? 0;
  set motorVehicleTheftIndex(int? val) => _motorVehicleTheftIndex = val;

  void incrementMotorVehicleTheftIndex(int amount) =>
      motorVehicleTheftIndex = motorVehicleTheftIndex + amount;

  bool hasMotorVehicleTheftIndex() => _motorVehicleTheftIndex != null;

  // "crime_Index" field.
  int? _crimeIndex;
  int get crimeIndex => _crimeIndex ?? 0;
  set crimeIndex(int? val) => _crimeIndex = val;

  void incrementCrimeIndex(int amount) => crimeIndex = crimeIndex + amount;

  bool hasCrimeIndex() => _crimeIndex != null;

  static CrimeDataStruct fromMap(Map<String, dynamic> data) => CrimeDataStruct(
        mortalityIndex: castToType<int>(data['mortality_Index']),
        murderIndex: castToType<int>(data['murder_Index']),
        forcibleRapeIndex: castToType<int>(data['forcible_Rape_Index']),
        forcibleRobberyIndex: castToType<int>(data['forcible_Robbery_Index']),
        aggravatedAssaultIndex:
            castToType<int>(data['aggravated_Assault_Index']),
        burglaryIndex: castToType<int>(data['burglary_Index']),
        larcenyIndex: castToType<int>(data['larceny_Index']),
        motorVehicleTheftIndex:
            castToType<int>(data['motor_Vehicle_Theft_Index']),
        crimeIndex: castToType<int>(data['crime_Index']),
      );

  static CrimeDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CrimeDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mortality_Index': _mortalityIndex,
        'murder_Index': _murderIndex,
        'forcible_Rape_Index': _forcibleRapeIndex,
        'forcible_Robbery_Index': _forcibleRobberyIndex,
        'aggravated_Assault_Index': _aggravatedAssaultIndex,
        'burglary_Index': _burglaryIndex,
        'larceny_Index': _larcenyIndex,
        'motor_Vehicle_Theft_Index': _motorVehicleTheftIndex,
        'crime_Index': _crimeIndex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mortality_Index': serializeParam(
          _mortalityIndex,
          ParamType.int,
        ),
        'murder_Index': serializeParam(
          _murderIndex,
          ParamType.int,
        ),
        'forcible_Rape_Index': serializeParam(
          _forcibleRapeIndex,
          ParamType.int,
        ),
        'forcible_Robbery_Index': serializeParam(
          _forcibleRobberyIndex,
          ParamType.int,
        ),
        'aggravated_Assault_Index': serializeParam(
          _aggravatedAssaultIndex,
          ParamType.int,
        ),
        'burglary_Index': serializeParam(
          _burglaryIndex,
          ParamType.int,
        ),
        'larceny_Index': serializeParam(
          _larcenyIndex,
          ParamType.int,
        ),
        'motor_Vehicle_Theft_Index': serializeParam(
          _motorVehicleTheftIndex,
          ParamType.int,
        ),
        'crime_Index': serializeParam(
          _crimeIndex,
          ParamType.int,
        ),
      }.withoutNulls;

  static CrimeDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CrimeDataStruct(
        mortalityIndex: deserializeParam(
          data['mortality_Index'],
          ParamType.int,
          false,
        ),
        murderIndex: deserializeParam(
          data['murder_Index'],
          ParamType.int,
          false,
        ),
        forcibleRapeIndex: deserializeParam(
          data['forcible_Rape_Index'],
          ParamType.int,
          false,
        ),
        forcibleRobberyIndex: deserializeParam(
          data['forcible_Robbery_Index'],
          ParamType.int,
          false,
        ),
        aggravatedAssaultIndex: deserializeParam(
          data['aggravated_Assault_Index'],
          ParamType.int,
          false,
        ),
        burglaryIndex: deserializeParam(
          data['burglary_Index'],
          ParamType.int,
          false,
        ),
        larcenyIndex: deserializeParam(
          data['larceny_Index'],
          ParamType.int,
          false,
        ),
        motorVehicleTheftIndex: deserializeParam(
          data['motor_Vehicle_Theft_Index'],
          ParamType.int,
          false,
        ),
        crimeIndex: deserializeParam(
          data['crime_Index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CrimeDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CrimeDataStruct &&
        mortalityIndex == other.mortalityIndex &&
        murderIndex == other.murderIndex &&
        forcibleRapeIndex == other.forcibleRapeIndex &&
        forcibleRobberyIndex == other.forcibleRobberyIndex &&
        aggravatedAssaultIndex == other.aggravatedAssaultIndex &&
        burglaryIndex == other.burglaryIndex &&
        larcenyIndex == other.larcenyIndex &&
        motorVehicleTheftIndex == other.motorVehicleTheftIndex &&
        crimeIndex == other.crimeIndex;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mortalityIndex,
        murderIndex,
        forcibleRapeIndex,
        forcibleRobberyIndex,
        aggravatedAssaultIndex,
        burglaryIndex,
        larcenyIndex,
        motorVehicleTheftIndex,
        crimeIndex
      ]);
}

CrimeDataStruct createCrimeDataStruct({
  int? mortalityIndex,
  int? murderIndex,
  int? forcibleRapeIndex,
  int? forcibleRobberyIndex,
  int? aggravatedAssaultIndex,
  int? burglaryIndex,
  int? larcenyIndex,
  int? motorVehicleTheftIndex,
  int? crimeIndex,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CrimeDataStruct(
      mortalityIndex: mortalityIndex,
      murderIndex: murderIndex,
      forcibleRapeIndex: forcibleRapeIndex,
      forcibleRobberyIndex: forcibleRobberyIndex,
      aggravatedAssaultIndex: aggravatedAssaultIndex,
      burglaryIndex: burglaryIndex,
      larcenyIndex: larcenyIndex,
      motorVehicleTheftIndex: motorVehicleTheftIndex,
      crimeIndex: crimeIndex,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CrimeDataStruct? updateCrimeDataStruct(
  CrimeDataStruct? crimeData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    crimeData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCrimeDataStructData(
  Map<String, dynamic> firestoreData,
  CrimeDataStruct? crimeData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (crimeData == null) {
    return;
  }
  if (crimeData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && crimeData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final crimeDataData = getCrimeDataFirestoreData(crimeData, forFieldValue);
  final nestedData = crimeDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = crimeData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCrimeDataFirestoreData(
  CrimeDataStruct? crimeData, [
  bool forFieldValue = false,
]) {
  if (crimeData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(crimeData.toMap());

  // Add any Firestore field values
  crimeData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCrimeDataListFirestoreData(
  List<CrimeDataStruct>? crimeDatas,
) =>
    crimeDatas?.map((e) => getCrimeDataFirestoreData(e, true)).toList() ?? [];
