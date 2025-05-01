// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompetitorStruct extends FFFirebaseStruct {
  CompetitorStruct({
    String? name,
    int? distanceFt,
    int? walkingTimeMin,
    int? buildingSizeSqft,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _distanceFt = distanceFt,
        _walkingTimeMin = walkingTimeMin,
        _buildingSizeSqft = buildingSizeSqft,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "distance_ft" field.
  int? _distanceFt;
  int get distanceFt => _distanceFt ?? 0;
  set distanceFt(int? val) => _distanceFt = val;

  void incrementDistanceFt(int amount) => distanceFt = distanceFt + amount;

  bool hasDistanceFt() => _distanceFt != null;

  // "walking_time_min" field.
  int? _walkingTimeMin;
  int get walkingTimeMin => _walkingTimeMin ?? 0;
  set walkingTimeMin(int? val) => _walkingTimeMin = val;

  void incrementWalkingTimeMin(int amount) =>
      walkingTimeMin = walkingTimeMin + amount;

  bool hasWalkingTimeMin() => _walkingTimeMin != null;

  // "building_size_sqft" field.
  int? _buildingSizeSqft;
  int get buildingSizeSqft => _buildingSizeSqft ?? 0;
  set buildingSizeSqft(int? val) => _buildingSizeSqft = val;

  void incrementBuildingSizeSqft(int amount) =>
      buildingSizeSqft = buildingSizeSqft + amount;

  bool hasBuildingSizeSqft() => _buildingSizeSqft != null;

  static CompetitorStruct fromMap(Map<String, dynamic> data) =>
      CompetitorStruct(
        name: data['name'] as String?,
        distanceFt: castToType<int>(data['distance_ft']),
        walkingTimeMin: castToType<int>(data['walking_time_min']),
        buildingSizeSqft: castToType<int>(data['building_size_sqft']),
      );

  static CompetitorStruct? maybeFromMap(dynamic data) => data is Map
      ? CompetitorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'distance_ft': _distanceFt,
        'walking_time_min': _walkingTimeMin,
        'building_size_sqft': _buildingSizeSqft,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'distance_ft': serializeParam(
          _distanceFt,
          ParamType.int,
        ),
        'walking_time_min': serializeParam(
          _walkingTimeMin,
          ParamType.int,
        ),
        'building_size_sqft': serializeParam(
          _buildingSizeSqft,
          ParamType.int,
        ),
      }.withoutNulls;

  static CompetitorStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompetitorStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        distanceFt: deserializeParam(
          data['distance_ft'],
          ParamType.int,
          false,
        ),
        walkingTimeMin: deserializeParam(
          data['walking_time_min'],
          ParamType.int,
          false,
        ),
        buildingSizeSqft: deserializeParam(
          data['building_size_sqft'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CompetitorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompetitorStruct &&
        name == other.name &&
        distanceFt == other.distanceFt &&
        walkingTimeMin == other.walkingTimeMin &&
        buildingSizeSqft == other.buildingSizeSqft;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, distanceFt, walkingTimeMin, buildingSizeSqft]);
}

CompetitorStruct createCompetitorStruct({
  String? name,
  int? distanceFt,
  int? walkingTimeMin,
  int? buildingSizeSqft,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompetitorStruct(
      name: name,
      distanceFt: distanceFt,
      walkingTimeMin: walkingTimeMin,
      buildingSizeSqft: buildingSizeSqft,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompetitorStruct? updateCompetitorStruct(
  CompetitorStruct? competitor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    competitor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompetitorStructData(
  Map<String, dynamic> firestoreData,
  CompetitorStruct? competitor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (competitor == null) {
    return;
  }
  if (competitor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && competitor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final competitorData = getCompetitorFirestoreData(competitor, forFieldValue);
  final nestedData = competitorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = competitor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompetitorFirestoreData(
  CompetitorStruct? competitor, [
  bool forFieldValue = false,
]) {
  if (competitor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(competitor.toMap());

  // Add any Firestore field values
  competitor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompetitorListFirestoreData(
  List<CompetitorStruct>? competitors,
) =>
    competitors?.map((e) => getCompetitorFirestoreData(e, true)).toList() ?? [];
