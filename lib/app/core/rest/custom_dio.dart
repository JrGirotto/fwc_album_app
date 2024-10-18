import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/config/env/env.dart';
import 'package:fwc_album_app/app/core/rest/interceptors/auth_interceptor.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';

class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }

  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
  }
}

