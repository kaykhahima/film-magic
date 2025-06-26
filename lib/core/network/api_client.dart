import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:film_magic/core/constants/api_constants.dart';
import 'package:film_magic/core/errors/failures.dart';

class ApiClient {
  final http.Client _httpClient;
  final String _apiKey;

  ApiClient(this._httpClient, this._apiKey);

  /// Creates the authorization header with the API key
  String get _authorizationHeader => 'Bearer $_apiKey';

  /// Builds the full URL for a given endpoint
  Uri buildUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final baseParams = <String, dynamic>{};

    if (queryParameters != null) {
      baseParams.addAll(queryParameters);
    }

    return Uri.parse(
      '${ApiConstants.tmdbBaseUrl}$endpoint',
    ).replace(queryParameters: baseParams);
  }

  /// Performs a GET request to the TMDB API
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final url = buildUrl(endpoint, queryParameters: queryParameters);

      final response = await _httpClient
          .get(
            url,
            headers: {
              ApiConstants.authorizationHeader: _authorizationHeader,
              ApiConstants.acceptHeader: ApiConstants.acceptValue,
            },
          )
          .timeout(const Duration(seconds: 10));

      return _processResponse(response);
    } on SocketException {
      throw NetworkFailure(message: 'No internet connection');
    } on HttpException {
      throw ServerFailure(message: 'Server error occurred');
    } on FormatException {
      throw ServerFailure(message: 'Invalid response format');
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  /// Performs a POST request to the TMDB API
  Future<Map<String, dynamic>> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final url = buildUrl(endpoint, queryParameters: queryParameters);

      final response = await _httpClient.post(
        url,
        headers: {
          ApiConstants.authorizationHeader: _authorizationHeader,
          ApiConstants.acceptHeader: ApiConstants.acceptValue,
          ApiConstants.contentTypeHeader: ApiConstants.contentTypeValue,
        },
        body: json.encode(body),
      );

      return _processResponse(response);
    } on SocketException {
      throw NetworkFailure(message: 'No internet connection');
    } on HttpException {
      throw ServerFailure(message: 'Server error occurred');
    } on FormatException {
      throw ServerFailure(message: 'Invalid response format');
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  /// Process the HTTP response and handle errors
  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      final errorResponse = json.decode(response.body) as Map<String, dynamic>;
      final errorMessage = errorResponse['status_message'] ?? 'Unknown error';
      final errorCode = errorResponse['status_code'] ?? response.statusCode;

      throw ServerFailure(message: 'Error $errorCode: $errorMessage');
    }
  }
}
