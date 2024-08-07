import 'dart:convert';
import 'dart:io';

import 'package:hotel_manage/data/app_exception.dart';
import 'package:hotel_manage/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class NetworkApiServices extends BaseApiServices{

  // getApiResponse :-
  @override
  Future getApiResponse(String url) async{
   dynamic responseJson;
   try{
     Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson = apiResponse(response);
   }catch(e){
     throw FetchDataException("No Internet Connection");
   }
   return responseJson;
  }

  // postApiResponse :-
  @override
  Future postApiResponse(String url, dynamic data) async{
    dynamic responseJson ;
   try{
     Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
     responseJson = apiResponse(response);
   }on SocketException{
     throw FetchDataException("No Internet Connection");
   }
   return responseJson;
  }

  // updateApiResponse :-
  @override
  Future updateApiResponse(String url, data) async{
    dynamic responseJson ;
    try{
      Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = apiResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // putApiResponse :-
  @override
  Future putApiResponse(String url, data) async{
    dynamic responseJson ;
    try{
      Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = apiResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // deleteApiResponse :-
  @override
  Future deleteApiResponse(String url, data) async{
    dynamic responseJson ;
    try{
      Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = apiResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }


  // apiResponse :-
  dynamic apiResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
    // default:
    //   throw FetchDataException("error accured wile communication with server"+'with status code' + response.statusCode.toString());
    }
  }

}