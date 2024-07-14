import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/utils/constants.dart';
@lazySingleton
class ApiManager{
 late Dio dio;
  ApiManager(){
    dio=Dio();
  }
 Future<Response>getData(String endpoint,{Map<String, dynamic>? param,Map<String, dynamic>? header}){
    return dio.get(constants.baseURL+endpoint,queryParameters:param,options: Options(
        headers:header
    ) );
 }

 Future<Response>postData(String endpoint,{Map<String, dynamic>? body,Map<String, dynamic>? header}){
   return dio.post(constants.baseURL+endpoint,data: body,options: Options(
     headers:header
   ));
 }
}