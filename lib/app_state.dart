import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<PropertyStruct> _propertyList = [];
  List<PropertyStruct> get propertyList => _propertyList;
  set propertyList(List<PropertyStruct> value) {
    _propertyList = value;
  }

  void addToPropertyList(PropertyStruct value) {
    propertyList.add(value);
  }

  void removeFromPropertyList(PropertyStruct value) {
    propertyList.remove(value);
  }

  void removeAtIndexFromPropertyList(int index) {
    propertyList.removeAt(index);
  }

  void updatePropertyListAtIndex(
    int index,
    PropertyStruct Function(PropertyStruct) updateFn,
  ) {
    propertyList[index] = updateFn(_propertyList[index]);
  }

  void insertAtIndexInPropertyList(int index, PropertyStruct value) {
    propertyList.insert(index, value);
  }

  List<int> _scoreIndices = [0, 1, 2, 3, 4, 5];
  List<int> get scoreIndices => _scoreIndices;
  set scoreIndices(List<int> value) {
    _scoreIndices = value;
  }

  void addToScoreIndices(int value) {
    scoreIndices.add(value);
  }

  void removeFromScoreIndices(int value) {
    scoreIndices.remove(value);
  }

  void removeAtIndexFromScoreIndices(int index) {
    scoreIndices.removeAt(index);
  }

  void updateScoreIndicesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    scoreIndices[index] = updateFn(_scoreIndices[index]);
  }

  void insertAtIndexInScoreIndices(int index, int value) {
    scoreIndices.insert(index, value);
  }

  List<GoogleMapDataStruct> _testMap = [
    GoogleMapDataStruct.fromSerializableMap(jsonDecode(
        '{\"latLng\":\"37.36829710000001,-122.0294885\",\"iconPath\":\"lease_marker.png\",\"title\":\"Marker 2\",\"description\":\"Description 2\",\"listingId\":\"14629659\",\"type\":\"lease\"}')),
    GoogleMapDataStruct.fromSerializableMap(jsonDecode(
        '{\"latLng\":\"37.4230622,-122.0842795\",\"iconPath\":\"sale_marker.png\",\"title\":\"Marker 3\",\"description\":\"Description 3\",\"listingId\":\"Hello World\",\"type\":\"Hello World\"}'))
  ];
  List<GoogleMapDataStruct> get testMap => _testMap;
  set testMap(List<GoogleMapDataStruct> value) {
    _testMap = value;
  }

  void addToTestMap(GoogleMapDataStruct value) {
    testMap.add(value);
  }

  void removeFromTestMap(GoogleMapDataStruct value) {
    testMap.remove(value);
  }

  void removeAtIndexFromTestMap(int index) {
    testMap.removeAt(index);
  }

  void updateTestMapAtIndex(
    int index,
    GoogleMapDataStruct Function(GoogleMapDataStruct) updateFn,
  ) {
    testMap[index] = updateFn(_testMap[index]);
  }

  void insertAtIndexInTestMap(int index, GoogleMapDataStruct value) {
    testMap.insert(index, value);
  }

  String _code = '';
  String get code => _code;
  set code(String value) {
    _code = value;
  }
}
