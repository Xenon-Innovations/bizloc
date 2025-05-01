import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Loopnet Group Code

class LoopnetGroup {
  static String getBaseUrl() =>
      'https://loopnet-api.p.rapidapi.com/loopnet/property';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'x-rapidapi-host': 'loopnet-api.p.rapidapi.com',
    'x-rapidapi-key': '301ef7a2f3msh4c7189049e65c5ep1b0177jsn59cb16e3350b',
  };
  static SaleDetailsCall saleDetailsCall = SaleDetailsCall();
  static LeaseDetailsCall leaseDetailsCall = LeaseDetailsCall();
}

class SaleDetailsCall {
  Future<ApiCallResponse> call({
    String? listingId = '',
  }) async {
    final baseUrl = LoopnetGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "listingId": "${escapeStringForJson(listingId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sale Details',
      apiUrl: '${baseUrl}/SaleDetails',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-rapidapi-host': 'loopnet-api.p.rapidapi.com',
        'x-rapidapi-key': '301ef7a2f3msh4c7189049e65c5ep1b0177jsn59cb16e3350b',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].price''',
      ));
  List<String>? imagesURLs(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? buildingHeight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.buildingHeight''',
      ));
  String? buildingSize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.buildingSize''',
      ));
  String? landAcres(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.landAcres''',
      ));
  String? yearBuiltRenowated(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.yearBuiltRenovated''',
      ));
  String? frontage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.frontage[0]''',
      ));
  String? parkingRatio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].parkingRatio''',
      ));
  String? parking(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.parking''',
      ));
  String? zoningCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].zoning.ZoningCode''',
      ));
  String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].summary''',
      ));
  String? brokerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].broker[0].name''',
      ));
  String? brokerPhone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].broker[0].phone''',
      ));
  String? brokerEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].broker[0].email''',
      ));
  String? brokerTagLine(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].broker[0].tagLine''',
      ));
  String? zoning(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.zoning''',
      ));
  String? yearBuilt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.yearBuilt''',
      ));
  List<String>? hightlights(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].highlights''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? numberOfStories(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].propertyFacts.noStories''',
      ));
}

class LeaseDetailsCall {
  Future<ApiCallResponse> call({
    String? listingId = '',
  }) async {
    final baseUrl = LoopnetGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "listingId": "${escapeStringForJson(listingId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lease Details',
      apiUrl: '${baseUrl}/LeaseDetails',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-rapidapi-host': 'loopnet-api.p.rapidapi.com',
        'x-rapidapi-key': '301ef7a2f3msh4c7189049e65c5ep1b0177jsn59cb16e3350b',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? listingName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].header.listingName''',
      ));
  List<String>? imagesURLs(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? yearBuilt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].yearBuilt''',
      ));
  String? size(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].size''',
      ));
  String? totalBuildingSize(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].totalBuildingSize''',
      ));
  String? buildingSize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].buildingSize''',
      ));
  String? rent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].rent''',
      ));
  String? rentType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].rentType''',
      ));
  List? availableSpaces(dynamic response) => getJsonField(
        response,
        r'''$.data[:].available_spaces''',
        true,
      ) as List?;
  List? brokers(dynamic response) => getJsonField(
        response,
        r'''$.data[:].broker''',
        true,
      ) as List?;
  List<String>? highlights(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].highlights''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic summary(dynamic response) => getJsonField(
        response,
        r'''$.data[:].summary''',
      );
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].description''',
      ));
}

/// End Loopnet Group Code

class GeocodeCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GeocodeCall',
        'variables': {
          'address': address,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic? latlng(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location''',
      );
  static String? adress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      ));
}

class ReverseGeocodeCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ReverseGeocodeCall',
        'variables': {
          'latlng': latlng,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic? latlng(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location''',
      );
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static double? locLat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      ));
  static double? locLng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      ));
}

class GetLocationReportCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    final ffApiRequestBody = '''
{
  "address": "${escapeStringForJson(address)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Location Report',
      apiUrl:
          'https://us-central1-biz-loc-blmajx.cloudfunctions.net/locationReport',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? population(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.population''',
      ));
  static double? medianAge(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.medianAge''',
      ));
}

class GetLoopnetPropertyCall {
  static Future<ApiCallResponse> call({
    String? zipCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "zipCode": "${escapeStringForJson(zipCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Loopnet Property',
      apiUrl:
          'https://us-central1-biz-loc-blmajx.cloudfunctions.net/getLoopnetProperty',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? population(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.population''',
      ));
  static double? medianAge(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.medianAge''',
      ));
}

class ChangeUserPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? newPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change User Password',
      apiUrl:
          'https://us-central1-biz-loc-blmajx.cloudfunctions.net/changeUserPassword',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? population(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.population''',
      ));
  static double? medianAge(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.medianAge''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
