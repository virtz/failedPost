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


  static Future<bool> addGenre(String genre) async {
    var url = "https://fierce-earth-23127.herokuapp.com/api/genres";
    bool b;

    final res = await Dio().post(
      url,
      data: {
        "name":genre,
      },
      options: Options(
        headers: {
          "x-auth-token": token,
          "Content-type": "application/json; charset=utf-8"
        },
      ),
    );
    print("Res ${res.data}");
    if(res.statusCode == 200){
      print(res.statusCode.toString());
      b = true;
    }else{
      b = false;
    }

    return b;
  }
}
