// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertyStruct extends FFFirebaseStruct {
  PropertyStruct({
    String? listingId,
    String? type,
    LatLng? coordinates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _listingId = listingId,
        _type = type,
        _coordinates = coordinates,
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

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  static PropertyStruct fromMap(Map<String, dynamic> data) => PropertyStruct(
        listingId: data['listingId'] as String?,
        type: data['type'] as String?,
        coordinates: data['coordinates'] as LatLng?,
      );

  static PropertyStruct? maybeFromMap(dynamic data) =>
      data is Map ? PropertyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'listingId': _listingId,
        'type': _type,
        'coordinates': _coordinates,
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
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static PropertyStruct fromSerializableMap(Map<String, dynamic> data) =>
      PropertyStruct(
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
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'PropertyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PropertyStruct &&
        listingId == other.listingId &&
        type == other.type &&
        coordinates == other.coordinates;
  }

  @override
  int get hashCode => const ListEquality().hash([listingId, type, coordinates]);
}

PropertyStruct createPropertyStruct({
  String? listingId,
  String? type,
  LatLng? coordinates,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PropertyStruct(
      listingId: listingId,
      type: type,
      coordinates: coordinates,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PropertyStruct? updatePropertyStruct(
  PropertyStruct? property, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    property
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPropertyStructData(
  Map<String, dynamic> firestoreData,
  PropertyStruct? property,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (property == null) {
    return;
  }
  if (property.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && property.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final propertyData = getPropertyFirestoreData(property, forFieldValue);
  final nestedData = propertyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = property.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPropertyFirestoreData(
  PropertyStruct? property, [
  bool forFieldValue = false,
]) {
  if (property == null) {
    return {};
  }
  final firestoreData = mapToFirestore(property.toMap());

  // Add any Firestore field values
  property.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPropertyListFirestoreData(
  List<PropertyStruct>? propertys,
) =>
    propertys?.map((e) => getPropertyFirestoreData(e, true)).toList() ?? [];
