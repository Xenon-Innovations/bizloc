// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HouseholdIncomeStruct extends FFFirebaseStruct {
  HouseholdIncomeStruct({
    int? pct0to40K,
    int? pct60Kto80K,
    int? pct80KandHigher,
    int? pct40Kto60K,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pct0to40K = pct0to40K,
        _pct60Kto80K = pct60Kto80K,
        _pct80KandHigher = pct80KandHigher,
        _pct40Kto60K = pct40Kto60K,
        super(firestoreUtilData);

  // "pct0to40K" field.
  int? _pct0to40K;
  int get pct0to40K => _pct0to40K ?? 0;
  set pct0to40K(int? val) => _pct0to40K = val;

  void incrementPct0to40K(int amount) => pct0to40K = pct0to40K + amount;

  bool hasPct0to40K() => _pct0to40K != null;

  // "pct60Kto80K" field.
  int? _pct60Kto80K;
  int get pct60Kto80K => _pct60Kto80K ?? 0;
  set pct60Kto80K(int? val) => _pct60Kto80K = val;

  void incrementPct60Kto80K(int amount) => pct60Kto80K = pct60Kto80K + amount;

  bool hasPct60Kto80K() => _pct60Kto80K != null;

  // "pct80KandHigher" field.
  int? _pct80KandHigher;
  int get pct80KandHigher => _pct80KandHigher ?? 0;
  set pct80KandHigher(int? val) => _pct80KandHigher = val;

  void incrementPct80KandHigher(int amount) =>
      pct80KandHigher = pct80KandHigher + amount;

  bool hasPct80KandHigher() => _pct80KandHigher != null;

  // "pct40Kto60K" field.
  int? _pct40Kto60K;
  int get pct40Kto60K => _pct40Kto60K ?? 0;
  set pct40Kto60K(int? val) => _pct40Kto60K = val;

  void incrementPct40Kto60K(int amount) => pct40Kto60K = pct40Kto60K + amount;

  bool hasPct40Kto60K() => _pct40Kto60K != null;

  static HouseholdIncomeStruct fromMap(Map<String, dynamic> data) =>
      HouseholdIncomeStruct(
        pct0to40K: castToType<int>(data['pct0to40K']),
        pct60Kto80K: castToType<int>(data['pct60Kto80K']),
        pct80KandHigher: castToType<int>(data['pct80KandHigher']),
        pct40Kto60K: castToType<int>(data['pct40Kto60K']),
      );

  static HouseholdIncomeStruct? maybeFromMap(dynamic data) => data is Map
      ? HouseholdIncomeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pct0to40K': _pct0to40K,
        'pct60Kto80K': _pct60Kto80K,
        'pct80KandHigher': _pct80KandHigher,
        'pct40Kto60K': _pct40Kto60K,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pct0to40K': serializeParam(
          _pct0to40K,
          ParamType.int,
        ),
        'pct60Kto80K': serializeParam(
          _pct60Kto80K,
          ParamType.int,
        ),
        'pct80KandHigher': serializeParam(
          _pct80KandHigher,
          ParamType.int,
        ),
        'pct40Kto60K': serializeParam(
          _pct40Kto60K,
          ParamType.int,
        ),
      }.withoutNulls;

  static HouseholdIncomeStruct fromSerializableMap(Map<String, dynamic> data) =>
      HouseholdIncomeStruct(
        pct0to40K: deserializeParam(
          data['pct0to40K'],
          ParamType.int,
          false,
        ),
        pct60Kto80K: deserializeParam(
          data['pct60Kto80K'],
          ParamType.int,
          false,
        ),
        pct80KandHigher: deserializeParam(
          data['pct80KandHigher'],
          ParamType.int,
          false,
        ),
        pct40Kto60K: deserializeParam(
          data['pct40Kto60K'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HouseholdIncomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HouseholdIncomeStruct &&
        pct0to40K == other.pct0to40K &&
        pct60Kto80K == other.pct60Kto80K &&
        pct80KandHigher == other.pct80KandHigher &&
        pct40Kto60K == other.pct40Kto60K;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([pct0to40K, pct60Kto80K, pct80KandHigher, pct40Kto60K]);
}

HouseholdIncomeStruct createHouseholdIncomeStruct({
  int? pct0to40K,
  int? pct60Kto80K,
  int? pct80KandHigher,
  int? pct40Kto60K,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HouseholdIncomeStruct(
      pct0to40K: pct0to40K,
      pct60Kto80K: pct60Kto80K,
      pct80KandHigher: pct80KandHigher,
      pct40Kto60K: pct40Kto60K,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HouseholdIncomeStruct? updateHouseholdIncomeStruct(
  HouseholdIncomeStruct? householdIncome, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    householdIncome
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHouseholdIncomeStructData(
  Map<String, dynamic> firestoreData,
  HouseholdIncomeStruct? householdIncome,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (householdIncome == null) {
    return;
  }
  if (householdIncome.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && householdIncome.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final householdIncomeData =
      getHouseholdIncomeFirestoreData(householdIncome, forFieldValue);
  final nestedData =
      householdIncomeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = householdIncome.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHouseholdIncomeFirestoreData(
  HouseholdIncomeStruct? householdIncome, [
  bool forFieldValue = false,
]) {
  if (householdIncome == null) {
    return {};
  }
  final firestoreData = mapToFirestore(householdIncome.toMap());

  // Add any Firestore field values
  householdIncome.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHouseholdIncomeListFirestoreData(
  List<HouseholdIncomeStruct>? householdIncomes,
) =>
    householdIncomes
        ?.map((e) => getHouseholdIncomeFirestoreData(e, true))
        .toList() ??
    [];
