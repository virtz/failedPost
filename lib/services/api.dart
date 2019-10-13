import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


const baseUrl = "https://fierce-earth-23127.herokuapp.com/api";

class Api {
  static var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZDliODk2MzcwNWRlNTAwMTdkMDI1MGIiLCJpYXQiOjE1NzA0NzQzNjB9.X66gqP7fnwU2iKX2kZIa1ZmJuZn9G3SH6IKAYYe_ggM";

  final JsonDecoder _decoder = new JsonDecoder();

  static Future getGenres() async {
    var url;
    var client = http.Client();
    try {
      url = baseUrl + "/genres";
      return client.get(Uri.encodeFull(url)).whenComplete(client.close);
    } catch (ex) {
      print(ex);
    }
  }


  static Future<bool> addGenre(Map<String,dynamic> genre) async {
    Dio dio = Dio();
        Map<String, String> headers = {
          // HttpHeaders.contentTypeHeader: "application/json",
          // HttpHeaders.authorizationHeader: token
       "Content-type": "application/json",
      "x-auth-token": token,
      "accept": "application/json",
    };
    try {
      var url = "https://fierce-earth-23127.herokuapp.com/api/genres";
      //var client = http.Client();
      final response = await dio.post(url,data: {"name":genre},options: Options(headers: headers));
       print("Res $response");
       if(response.statusCode < 200 || response.statusCode > 400 || json == null){
         print(response.statusCode.toString());
         
       }
      return response.data;
     
    } catch (e) {
      return false;
    }
  }
}
