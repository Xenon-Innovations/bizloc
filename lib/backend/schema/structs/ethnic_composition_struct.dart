// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EthnicCompositionStruct extends FFFirebaseStruct {
  EthnicCompositionStruct({
    int? white,
    int? black,
    int? latino,
    int? asian,
    int? other,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _white = white,
        _black = black,
        _latino = latino,
        _asian = asian,
        _other = other,
        super(firestoreUtilData);

  // "white" field.
  int? _white;
  int get white => _white ?? 0;
  set white(int? val) => _white = val;

  void incrementWhite(int amount) => white = white + amount;

  bool hasWhite() => _white != null;

  // "black" field.
  int? _black;
  int get black => _black ?? 0;
  set black(int? val) => _black = val;

  void incrementBlack(int amount) => black = black + amount;

  bool hasBlack() => _black != null;

  // "latino" field.
  int? _latino;
  int get latino => _latino ?? 0;
  set latino(int? val) => _latino = val;

  void incrementLatino(int amount) => latino = latino + amount;

  bool hasLatino() => _latino != null;

  // "asian" field.
  int? _asian;
  int get asian => _asian ?? 0;
  set asian(int? val) => _asian = val;

  void incrementAsian(int amount) => asian = asian + amount;

  bool hasAsian() => _asian != null;

  // "other" field.
  int? _other;
  int get other => _other ?? 0;
  set other(int? val) => _other = val;

  void incrementOther(int amount) => other = other + amount;

  bool hasOther() => _other != null;

  static EthnicCompositionStruct fromMap(Map<String, dynamic> data) =>
      EthnicCompositionStruct(
        white: castToType<int>(data['white']),
        black: castToType<int>(data['black']),
        latino: castToType<int>(data['latino']),
        asian: castToType<int>(data['asian']),
        other: castToType<int>(data['other']),
      );

  static EthnicCompositionStruct? maybeFromMap(dynamic data) => data is Map
      ? EthnicCompositionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'white': _white,
        'black': _black,
        'latino': _latino,
        'asian': _asian,
        'other': _other,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'white': serializeParam(
          _white,
          ParamType.int,
        ),
        'black': serializeParam(
          _black,
          ParamType.int,
        ),
        'latino': serializeParam(
          _latino,
          ParamType.int,
        ),
        'asian': serializeParam(
          _asian,
          ParamType.int,
        ),
        'other': serializeParam(
          _other,
          ParamType.int,
        ),
      }.withoutNulls;

  static EthnicCompositionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EthnicCompositionStruct(
        white: deserializeParam(
          data['white'],
          ParamType.int,
          false,
        ),
        black: deserializeParam(
          data['black'],
          ParamType.int,
          false,
        ),
        latino: deserializeParam(
          data['latino'],
          ParamType.int,
          false,
        ),
        asian: deserializeParam(
          data['asian'],
          ParamType.int,
          false,
        ),
        other: deserializeParam(
          data['other'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'EthnicCompositionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EthnicCompositionStruct &&
        white == other.white &&
        black == other.black &&
        latino == other.latino &&
        asian == other.asian &&
        other == other.other;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([white, black, latino, asian, other]);
}

EthnicCompositionStruct createEthnicCompositionStruct({
  int? white,
  int? black,
  int? latino,
  int? asian,
  int? other,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EthnicCompositionStruct(
      white: white,
      black: black,
      latino: latino,
      asian: asian,
      other: other,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EthnicCompositionStruct? updateEthnicCompositionStruct(
  EthnicCompositionStruct? ethnicComposition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ethnicComposition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEthnicCompositionStructData(
  Map<String, dynamic> firestoreData,
  EthnicCompositionStruct? ethnicComposition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ethnicComposition == null) {
    return;
  }
  if (ethnicComposition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ethnicComposition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ethnicCompositionData =
      getEthnicCompositionFirestoreData(ethnicComposition, forFieldValue);
  final nestedData =
      ethnicCompositionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ethnicComposition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEthnicCompositionFirestoreData(
  EthnicCompositionStruct? ethnicComposition, [
  bool forFieldValue = false,
]) {
  if (ethnicComposition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ethnicComposition.toMap());

  // Add any Firestore field values
  ethnicComposition.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEthnicCompositionListFirestoreData(
  List<EthnicCompositionStruct>? ethnicCompositions,
) =>
    ethnicCompositions
        ?.map((e) => getEthnicCompositionFirestoreData(e, true))
        .toList() ??
    [];
