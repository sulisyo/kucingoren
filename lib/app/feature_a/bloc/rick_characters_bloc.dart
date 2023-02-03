import 'package:bloc/bloc.dart';
import 'package:oren/app/feature_a/bloc/rick_characters_event.dart';
import 'package:oren/app/feature_a/data/model/rick_characters.dart';
import 'package:meta/meta.dart';

import '../data/model/rick_character.dart';
import '../data/repository/rick_and_morty_respository.dart';

part 'rick_characters_state.dart';

class RickCharactersBloc
    extends Bloc<RickCharactersEvent, RickCharactersState> {
  RickCharactersBloc(this.repository) : super(RickCharactersInitial()) {
    on<RickCharactersEvent>(_loadCharacters);
  }

  int page = 1;
  final RickAndMortyRepository repository;

  void _loadCharacters(
      RickCharactersEvent event, Emitter<RickCharactersState> emit) async {
    if (!event.loadCharacters) return;

    if (state is RickCharactersLoading) return;

    final currentState = state;

    var oldPosts = <RickCharacter>[];
    if (currentState is RickCharactersLoaded) {
      oldPosts = currentState.rickCharacters;
    }

    emit(RickCharactersLoading(oldPosts, isFirstFetch: page == 1));

    RickCharacters characters = await repository.getCharacters(page);
    page++;

    final posts = (state as RickCharactersLoading).oldRickCharacters;
    posts.addAll(characters.results ?? []);

    emit(RickCharactersLoaded(posts));
  }
}
