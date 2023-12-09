import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetRespone(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No connection internet");
    }
    return responseJson;
  }

  @override
  Future getPostRespone(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response reponse = await http.post(Uri.parse(url), body: data, headers: {
        "Accept": "application/json",
        "Accept-Language": "fr"
      }).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(reponse);
    } on SocketException {
      throw FetchDataExceptions("No connection internet");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 500:
        throw InvalidRequestExceptions(response.body.toString());
      case 403:
        throw UnauthorisationExceptions(response.body.toString());
      case 422:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataExceptions(
            "erreur while communication with the server with status code ${response.statusCode}");
    }
  }
}
