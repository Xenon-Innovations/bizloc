// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PopulationDataStruct extends FFFirebaseStruct {
  PopulationDataStruct({
    int? year2017,
    int? year2018,
    int? year2019,
    int? year2020,
    int? year2021,
    int? year2022,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _year2017 = year2017,
        _year2018 = year2018,
        _year2019 = year2019,
        _year2020 = year2020,
        _year2021 = year2021,
        _year2022 = year2022,
        super(firestoreUtilData);

  // "year2017" field.
  int? _year2017;
  int get year2017 => _year2017 ?? 0;
  set year2017(int? val) => _year2017 = val;

  void incrementYear2017(int amount) => year2017 = year2017 + amount;

  bool hasYear2017() => _year2017 != null;

  // "year2018" field.
  int? _year2018;
  int get year2018 => _year2018 ?? 0;
  set year2018(int? val) => _year2018 = val;

  void incrementYear2018(int amount) => year2018 = year2018 + amount;

  bool hasYear2018() => _year2018 != null;

  // "year2019" field.
  int? _year2019;
  int get year2019 => _year2019 ?? 0;
  set year2019(int? val) => _year2019 = val;

  void incrementYear2019(int amount) => year2019 = year2019 + amount;

  bool hasYear2019() => _year2019 != null;

  // "year2020" field.
  int? _year2020;
  int get year2020 => _year2020 ?? 0;
  set year2020(int? val) => _year2020 = val;

  void incrementYear2020(int amount) => year2020 = year2020 + amount;

  bool hasYear2020() => _year2020 != null;

  // "year2021" field.
  int? _year2021;
  int get year2021 => _year2021 ?? 0;
  set year2021(int? val) => _year2021 = val;

  void incrementYear2021(int amount) => year2021 = year2021 + amount;

  bool hasYear2021() => _year2021 != null;

  // "year2022" field.
  int? _year2022;
  int get year2022 => _year2022 ?? 0;
  set year2022(int? val) => _year2022 = val;

  void incrementYear2022(int amount) => year2022 = year2022 + amount;

  bool hasYear2022() => _year2022 != null;

  static PopulationDataStruct fromMap(Map<String, dynamic> data) =>
      PopulationDataStruct(
        year2017: castToType<int>(data['year2017']),
        year2018: castToType<int>(data['year2018']),
        year2019: castToType<int>(data['year2019']),
        year2020: castToType<int>(data['year2020']),
        year2021: castToType<int>(data['year2021']),
        year2022: castToType<int>(data['year2022']),
      );

  static PopulationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PopulationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'year2017': _year2017,
        'year2018': _year2018,
        'year2019': _year2019,
        'year2020': _year2020,
        'year2021': _year2021,
        'year2022': _year2022,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year2017': serializeParam(
          _year2017,
          ParamType.int,
        ),
        'year2018': serializeParam(
          _year2018,
          ParamType.int,
        ),
        'year2019': serializeParam(
          _year2019,
          ParamType.int,
        ),
        'year2020': serializeParam(
          _year2020,
          ParamType.int,
        ),
        'year2021': serializeParam(
          _year2021,
          ParamType.int,
        ),
        'year2022': serializeParam(
          _year2022,
          ParamType.int,
        ),
      }.withoutNulls;

  static PopulationDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PopulationDataStruct(
        year2017: deserializeParam(
          data['year2017'],
          ParamType.int,
          false,
        ),
        year2018: deserializeParam(
          data['year2018'],
          ParamType.int,
          false,
        ),
        year2019: deserializeParam(
          data['year2019'],
          ParamType.int,
          false,
        ),
        year2020: deserializeParam(
          data['year2020'],
          ParamType.int,
          false,
        ),
        year2021: deserializeParam(
          data['year2021'],
          ParamType.int,
          false,
        ),
        year2022: deserializeParam(
          data['year2022'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PopulationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PopulationDataStruct &&
        year2017 == other.year2017 &&
        year2018 == other.year2018 &&
        year2019 == other.year2019 &&
        year2020 == other.year2020 &&
        year2021 == other.year2021 &&
        year2022 == other.year2022;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([year2017, year2018, year2019, year2020, year2021, year2022]);
}

PopulationDataStruct createPopulationDataStruct({
  int? year2017,
  int? year2018,
  int? year2019,
  int? year2020,
  int? year2021,
  int? year2022,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PopulationDataStruct(
      year2017: year2017,
      year2018: year2018,
      year2019: year2019,
      year2020: year2020,
      year2021: year2021,
      year2022: year2022,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PopulationDataStruct? updatePopulationDataStruct(
  PopulationDataStruct? populationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    populationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPopulationDataStructData(
  Map<String, dynamic> firestoreData,
  PopulationDataStruct? populationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (populationData == null) {
    return;
  }
  if (populationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && populationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final populationDataData =
      getPopulationDataFirestoreData(populationData, forFieldValue);
  final nestedData =
      populationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = populationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPopulationDataFirestoreData(
  PopulationDataStruct? populationData, [
  bool forFieldValue = false,
]) {
  if (populationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(populationData.toMap());

  // Add any Firestore field values
  populationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPopulationDataListFirestoreData(
  List<PopulationDataStruct>? populationDatas,
) =>
    populationDatas
        ?.map((e) => getPopulationDataFirestoreData(e, true))
        .toList() ??
    [];
