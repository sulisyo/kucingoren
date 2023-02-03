import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../repository/token_repository.dart';

@injectable
class ApiInterceptor extends Interceptor {
  ApiInterceptor(this._tokenRepository);

  final TokenRepository _tokenRepository;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (options.headers['requires-token'] == 'false') {
      // if the request doesn't need token, then just continue to the next
      // interceptor
      options.headers.remove('requiresToken'); //remove the auxiliary header
      return handler.next(options);
    }

    var token = _tokenRepository.getAccessToken();
    if (token == "" ) {
      token = await _tokenRepository.getAccessToken();
    }

    options.headers.addAll({'authorization': 'Bearer ${token!}'});
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // <-- here you can handle 401 response, which is not related to token expiration, globally to all requests
    return handler.next(err);
  }
}