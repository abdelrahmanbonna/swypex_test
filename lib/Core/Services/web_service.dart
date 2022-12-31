import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Config/constants.dart';
import 'toast_service.dart';

class WebService {
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  static WebService? _this;
  final String _baseURL = Constants.baseUrl;

  Dio publicDio = Dio();

  WebService._() {
    publicDio.options.baseUrl = _baseURL;
    publicDio.options.connectTimeout = 45000;
    initializeInterceptors();
  }

  initializeInterceptors() {
    publicDio.interceptors.clear();

    publicDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('send request ${options.uri}');
          log('headers: ${options.headers}');
          log('query parameters: ${options.queryParameters}');
          log('data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          debugPrint(response.data.toString());
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          log('path: ${e.requestOptions.path}');
          log('response: ${e.response}');
          log('statusCode: ${e.response?.statusCode}');
          log('data: ${e.response?.data}');
          log('-----------------------------------------------');
          if (e.response?.statusCode == 500) {
            EasyLoading.dismiss();
            ToastService.showUnExpectedErrorToast();
            return handler.next(e);
          } else if (e.error.runtimeType == SocketException) {
            EasyLoading.dismiss();
            ToastService.showNoInternetConnectionErrorToast();
            return handler.next(e);
          } else {
            EasyLoading.dismiss();
            return handler.next(e);
          }
        },
      ),
    );
  }
}
