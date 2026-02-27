import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_exception.dart';
import 'baseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  // getApiResponse :-
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      print("this line get data");
      print(response.body.toString());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // postApiResponse :-
  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);

      print(responseJson);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // updateApiResponse :-
  @override
  Future updateApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type ': 'application/json'},
              body: JsonEncoder(data))
          .timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // putApiResponse :-
  @override
  Future putApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type ': 'application/json'},
              body: jsonEncode(data))
          .timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // deleteApiResponse :-
  @override
  Future deleteApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type ': 'application/json'},
              body: jsonEncode(data))
          .timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // returnApiResponse :-
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(response.statusCode.toString());
      // "error during communication with server with status code"
    }
  }
}
