
part of 'rick_characters_bloc.dart';

@immutable
abstract class RickCharactersState {}

class RickCharactersInitial extends RickCharactersState {}
class RickCharactersLoaded extends RickCharactersState {
  final List<RickCharacter> rickCharacters;

  RickCharactersLoaded(this.rickCharacters);
}

class RickCharactersLoading extends RickCharactersState {
  final List<RickCharacter> oldRickCharacters;
  final bool isFirstFetch;

  RickCharactersLoading(this.oldRickCharacters, {this.isFirstFetch=false});
}