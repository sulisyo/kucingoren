
import 'package:dio/dio.dart';
import 'package:oren/app/feature_a/data/model/rick_characters.dart';
import 'package:retrofit/http.dart';
part 'rick_and_morty_service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api")
abstract class RickAndMortyService {
  factory RickAndMortyService(Dio dio, {String baseUrl}) = _RickAndMortyService;

  @GET("/character")
  Future<RickCharacters> getCharacter(
    @Query("page") int page
  );
}
