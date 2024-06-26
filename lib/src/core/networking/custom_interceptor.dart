import 'package:dio/dio.dart';
import 'package:new_streamline/src/core/extentions.dart';

class CustomInterceptor extends Interceptor {
  // on response.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final bool isParsable = response.isParsable();
    if (!isParsable) {
      return handler.reject(DioException.badResponse(
          statusCode: response.statusCode!,
          requestOptions: response.requestOptions,
          response: response));
    }
    // handle session expiration here.
    // if (response.statusCode != null && response.statusCode == 401) {
    // N.offAllNamed(AuthRouter.signInScreen);
    // DependencyInjection.get<SharedPrefManager>().clearUserData();
    // Utils.showMessage(
    //     message: 'Your session is expired , please sign in again',
    //     messageType: MessageType.failure);
    // handler.resolve(response.data);
    // }
    return handler.resolve(response);
  }
}
