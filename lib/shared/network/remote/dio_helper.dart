import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization':token
    };
    return await dio.get(url, queryParameters: query);
  }

  Future<Response> postData({ 
    @required String url,
    Map<String, dynamic> query,
    @required dynamic data,
     String lang = 'en',
    String token
    }) async {
       dio.options.headers = {
         'Content-Type': 'application/json',
      'lang': lang,
      'Authorization':token
    };
    return await dio.post(
      url,
      data: data,
    );
  }
}
