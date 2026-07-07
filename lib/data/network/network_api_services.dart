import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_login/data/network/base_api_services.dart';
import 'package:mvvm_login/data/app_exceptions.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No internet connection');
    } on HttpException {
      throw FetchDataException('No internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    } on TimeoutException {
      throw RequestTimeOUt('Request timed out');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No internet connection');
    } on HttpException {
      throw FetchDataException('No internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    } on TimeoutException {
      throw RequestTimeOUt('Request timed out');
    }
    if (kDebugMode) {
      print("json response: $responseJson");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.body.toString());
    }

    // Try to decode body safely — some error responses come back empty or as plain text
    dynamic decodeBody() {
      if (response.body.isEmpty) return null;
      try {
        return jsonDecode(response.body);
      } on FormatException {
        // Not valid JSON — return raw text instead of crashing
        return response.body;
      }
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return decodeBody();

      case 400:
        throw BadRequestException(decodeBody()?.toString() ?? 'Bad request');

      case 401:
        throw UnauthorisedException(
            decodeBody()?.toString() ?? 'Unauthorised, please log in again');

      case 403:
        throw UnauthorisedException(
            decodeBody()?.toString() ?? 'Forbidden');

      case 404:
        throw FetchDataException(
            decodeBody()?.toString() ?? 'Resource not found');

      case 409:
        throw BadRequestException(
            decodeBody()?.toString() ?? 'Conflict occurred');

      case 500:
      case 502:
      case 503:
        throw FetchDataException(
            'Server error (${response.statusCode}). Please try again later.');

      default:
        throw FetchDataException(
            'Error occurred while communicating with server: ${response.statusCode}');
    }
  }
}