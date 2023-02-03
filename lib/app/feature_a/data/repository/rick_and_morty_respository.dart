import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../api/rick_and_morty_service.dart';
import '../model/rick_characters.dart';

class RickAndMortyRepository {

  final RickAndMortyService service;

  RickAndMortyRepository(this.service);

  Future<RickCharacters> getCharacters(int page) async {
    final characters = await service.getCharacter(page);
    return characters;
  }
  
}