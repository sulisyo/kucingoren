import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/something_model.dart';
import '../model/token_model.dart';

part 'api_one.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/something")
  Future<List<SomethingModel>> getSomething();

  @POST("/tasks")
  Future<void> createSomething(@Body() SomethingModel something);

  @GET("/refresh_token")
  Future<TokenModel> refreshToken(
      @Query("access_token") String accessToken,
      @Query("refresh_token") String refreshToken
      );
}

