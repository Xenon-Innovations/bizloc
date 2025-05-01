// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertyObjectStruct extends FFFirebaseStruct {
  PropertyObjectStruct({
    String? listingId,
    String? type,
    List<double>? coordinations,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _listingId = listingId,
        _type = type,
        _coordinations = coordinations,
        super(firestoreUtilData);

  // "listingId" field.
  String? _listingId;
  String get listingId => _listingId ?? '';
  set listingId(String? val) => _listingId = val;

  bool hasListingId() => _listingId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "coordinations" field.
  List<double>? _coordinations;
  List<double> get coordinations => _coordinations ?? const [];
  set coordinations(List<double>? val) => _coordinations = val;

  void updateCoordinations(Function(List<double>) updateFn) {
    updateFn(_coordinations ??= []);
  }

  bool hasCoordinations() => _coordinations != null;

  static PropertyObjectStruct fromMap(Map<String, dynamic> data) =>
      PropertyObjectStruct(
        listingId: data['listingId'] as String?,
        type: data['type'] as String?,
        coordinations: getDataList(data['coordinations']),
      );

  static PropertyObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? PropertyObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'listingId': _listingId,
        'type': _type,
        'coordinations': _coordinations,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'listingId': serializeParam(
          _listingId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'coordinations': serializeParam(
          _coordinations,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static PropertyObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      PropertyObjectStruct(
        listingId: deserializeParam(
          data['listingId'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        coordinations: deserializeParam<double>(
          data['coordinations'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'PropertyObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PropertyObjectStruct &&
        listingId == other.listingId &&
        type == other.type &&
        listEquality.equals(coordinations, other.coordinations);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([listingId, type, coordinations]);
}

PropertyObjectStruct createPropertyObjectStruct({
  String? listingId,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PropertyObjectStruct(
      listingId: listingId,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PropertyObjectStruct? updatePropertyObjectStruct(
  PropertyObjectStruct? propertyObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    propertyObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPropertyObjectStructData(
  Map<String, dynamic> firestoreData,
  PropertyObjectStruct? propertyObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (propertyObject == null) {
    return;
  }
  if (propertyObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && propertyObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final propertyObjectData =
      getPropertyObjectFirestoreData(propertyObject, forFieldValue);
  final nestedData =
      propertyObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = propertyObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPropertyObjectFirestoreData(
  PropertyObjectStruct? propertyObject, [
  bool forFieldValue = false,
]) {
  if (propertyObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(propertyObject.toMap());

  // Add any Firestore field values
  propertyObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPropertyObjectListFirestoreData(
  List<PropertyObjectStruct>? propertyObjects,
) =>
    propertyObjects
        ?.map((e) => getPropertyObjectFirestoreData(e, true))
        .toList() ??
    [];
