import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'dart:developer';

// ignore: constant_identifier_names
const String BASE_URL = "http://127.0.0.1:8000/api";

class ServerGate {
  Dio dio = Dio();
  ServerGate() {
    addInterceptors();
  }
  CancelToken cancelToken = CancelToken();

  Map<String, dynamic> _header() {
    return {
      // "Authorization": "Bearer ${UserHelper.accessToken}",
      // "Accept": "application/json",
      // "Accept-Language": LocaleKeys.Lang.tr(),
      // 'Authorization': CacheHelper.getFCMToken(),
      // "Accept-Language": CacheHelper.getLang(),
      "Accept": "application/json",
      "content-type": "application/json",
      "lang": "ar",
    };
  }

  void addInterceptors() {
    dio.interceptors.add(CustomApiInterceptor());
  }

  // [][][][][][][][][][][][][] POST DATA TO SERVER [][][][][][][][][][][][][] //
  StreamController<double> onSingleReceive = StreamController.broadcast();

  Future<CustomResponse> sendToServer({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
      log("--------- Server Gate Logger --------> \x1B[37m------ body for this req. -----\x1B[0m");
      Map<String, String> _buildBody = body.map((key, value) => MapEntry(key, value.toString()));
      log("--------- Server Gate Logger --------> \x1B[32m${jsonEncode(_buildBody)}\x1B[0m");
    }
    if (headers != null) {
      headers.addAll(_header());
      headers.removeWhere((key, value) => headers![key] == null || headers[key] == "");
    } else {
      headers = _header();
    }

    try {
      Response response = await dio.post(
        "$BASE_URL/$url",
        data: FormData.fromMap(body ?? {}),
        onSendProgress: (received, total) {
          onSingleReceive.add((received / total) - 0.05);
          //  print((received / total * 100).toStringAsFixed(0) + "%");
        },
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 5000,
          contentType: "multipart/form-data; boundary=<calculated when request is sent>",
          headers: headers,
        ),
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: response.data["message"] ?? "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    } catch (e) {
      return handleServerError(
        DioError(
          requestOptions: RequestOptions(path: url),
          response: Response(data: "DOCTYPE", requestOptions: RequestOptions(path: url)),
        ),
      );
    }
  }

  // ------- POST delete TO SERVER -------//
  Future<CustomResponse> deleteFromServer({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    // remove nulls from body
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
    }
    // add stander header
    if (headers != null) {
      headers.addAll(_header());
      headers.removeWhere((key, value) => headers![key] == null || headers[key] == "");
    } else {
      headers = _header();
    }

    try {
      Response response = await dio.delete(
        "$BASE_URL/$url",
        data: FormData.fromMap(body ?? {}),
        options: Options(
          headers: headers,
          sendTimeout: 5000,
          receiveTimeout: 5000,
        ),
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: response.data["message"] ?? "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    } catch (e) {
      return handleServerError(
        DioError(
          requestOptions: RequestOptions(path: url),
          response: Response(data: "DOCTYPE", requestOptions: RequestOptions(path: url)),
        ),
      );
    }
  }

  // ------- PUT DATA TO SERVER -------//
  Future<CustomResponse> putToServer({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    // remove nulls from body
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
    }
    // add stander header
    if (headers != null) {
      headers.addAll(_header());
      headers.removeWhere((key, value) => headers![key] == null || headers[key] == "");
    } else {
      headers = _header();
    }

    try {
      Response response = await dio.put(
        "$BASE_URL/$url",
        data: FormData.fromMap(body ?? {}),
        options: Options(
          headers: headers,
          sendTimeout: 5000,
          receiveTimeout: 5000,
        ),
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: response.data["message"] ?? "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    } catch (e) {
      return handleServerError(
        DioError(
          requestOptions: RequestOptions(path: url),
          response: Response(data: "DOCTYPE", requestOptions: RequestOptions(path: url)),
        ),
      );
    }
  }

  // ------ GET DATA FROM SERVER -------//
  Future<CustomResponse> getFromServer({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    // addInterceptors();
    // add stander header
    if (headers != null) {
      headers.addAll(_header());
      headers.removeWhere((key, value) => value == null || value == "");
    } else {
      headers = _header();
    }
    // remove nulls from params
    if (params != null) {
      params.removeWhere((key, value) => params[key] == null || params[key] == "");
    }
    try {
      Response response = await dio.get(
        url.startsWith("http") ? url : "$BASE_URL/$url",
        options: Options(
          headers: headers,
          sendTimeout: 5000,
          receiveTimeout: 5000,
        ),
        queryParameters: params,
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: (response.data["message"] ?? "Your request completed succesfully").toString(),
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    } catch (e) {
      return handleServerError(
        DioError(
          requestOptions: RequestOptions(path: url),
          response: Response(data: "DOCTYPE", requestOptions: RequestOptions(path: url)),
        ),
      );
    }
  }

  // ------ Download DATA FROM SERVER -------//

  Future<CustomResponse> downloadFromServer({
    required String url,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    dio = Dio();
    // add stander header
    if (headers != null) {
      headers.addAll(_header());
      headers.removeWhere((key, value) => headers![key] == null || headers[key] == "");
    } else {
      headers = _header();
    }

    try {
      Response response = await dio.download(url, path, onReceiveProgress: (received, total) {
        onSingleReceive.add((received / total));
      });
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    } catch (e) {
      return handleServerError(
        DioError(
          requestOptions: RequestOptions(path: url),
          response: Response(data: "DOCTYPE", requestOptions: RequestOptions(path: url)),
        ),
      );
    }
  }

  // -------- HANDLE ERROR ---------//
  CustomResponse handleServerError(DioError err) {
    if (err.type == DioErrorType.response) {
      if (err.response!.data.toString().contains("DOCTYPE") ||
          err.response!.data.toString().contains("<script>") ||
          err.response!.data["exception"] != null) {
        return CustomResponse(
          success: false,
          errType: 2,
          statusCode: err.response!.statusCode ?? 500,
          msg: 'server error',
          response: null,
        );
      }
      if (err.response!.statusCode == 401) {
        // UserHelper.logout();
        // SnackHelper.infoBar(message: lang.tr(LocaleKeys.Validator_Validate_The_registration_session_ended));
      }
      try {
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: (err.response!.data["errors"] as Map).values.first.first,
          error: null,
          response: err.response,
        );
      } catch (e) {
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: err.response?.data["message"],
          error: null,
          response: err.response,
        );
      }
    } else if (err.type == DioErrorType.receiveTimeout || err.type == DioErrorType.sendTimeout) {
      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 500,
        errType: 0,
        msg: 'server error',
        error: null,
        response: null,
      );
    } else {
      if (err.response == null) {
        return CustomResponse(
          success: false,
          statusCode: 402,
          errType: 0,
          msg: 'server error',
          error: null,
          response: null,
        );
      }
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: 2,
        msg: 'server error',
        error: null,
        response: null,
      );
    }
  }
}

class CustomApiInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Error Response -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[31m${err.response?.data}\x1B[0m");
    }
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    // CURRENT RESPONSE
    if (kDebugMode) {
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Response -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[32m${jsonEncode(response.data)}\x1B[0m");
    }
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // CURRENT REQUEST
    // FormData formData;
    // formData.fields
    // return Exception("hi error");
    if (kDebugMode) {
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Parameters Data -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[33m${options.queryParameters}\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Headers -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[33m${options.headers}\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Path -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[36m${options.path} \x1B[31m  API METHOD : (${options.method})\x1B[0m");
    }
    return super.onRequest(options, handler);
  }
}

class CustomResponse {
  bool success;
  int? errType;
  // 0 => network error
  // 1 => error from the server
  // 2 => other error
  String msg;
  int statusCode;
  Response? response;
  dynamic error;

  CustomResponse({
    this.success = false,
    this.errType = 0,
    this.msg = "",
    this.statusCode = 0,
    this.response,
    this.error,
  });
}

class CustomError {
  int? type;
  String? msg;
  dynamic error;

  CustomError({
    this.type,
    this.msg,
    this.error,
  });
}
