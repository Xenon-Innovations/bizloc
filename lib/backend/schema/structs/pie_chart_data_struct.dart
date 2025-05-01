// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PieChartDataStruct extends FFFirebaseStruct {
  PieChartDataStruct({
    int? num,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _num = num,
        _color = color,
        super(firestoreUtilData);

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  set num(int? val) => _num = val;

  void incrementNum(int amount) => num = num + amount;

  bool hasNum() => _num != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static PieChartDataStruct fromMap(Map<String, dynamic> data) =>
      PieChartDataStruct(
        num: castToType<int>(data['num']),
        color: getSchemaColor(data['color']),
      );

  static PieChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PieChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'num': _num,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'num': serializeParam(
          _num,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static PieChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PieChartDataStruct(
        num: deserializeParam(
          data['num'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'PieChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PieChartDataStruct &&
        num == other.num &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([num, color]);
}

PieChartDataStruct createPieChartDataStruct({
  int? num,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PieChartDataStruct(
      num: num,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PieChartDataStruct? updatePieChartDataStruct(
  PieChartDataStruct? pieChartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pieChartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPieChartDataStructData(
  Map<String, dynamic> firestoreData,
  PieChartDataStruct? pieChartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pieChartData == null) {
    return;
  }
  if (pieChartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pieChartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pieChartDataData =
      getPieChartDataFirestoreData(pieChartData, forFieldValue);
  final nestedData =
      pieChartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pieChartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPieChartDataFirestoreData(
  PieChartDataStruct? pieChartData, [
  bool forFieldValue = false,
]) {
  if (pieChartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pieChartData.toMap());

  // Add any Firestore field values
  pieChartData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPieChartDataListFirestoreData(
  List<PieChartDataStruct>? pieChartDatas,
) =>
    pieChartDatas?.map((e) => getPieChartDataFirestoreData(e, true)).toList() ??
    [];
