import 'dart:async';

import 'package:oren/app/feature_a/bloc/rick_characters_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/rick_characters_bloc.dart';
import '../data/model/rick_character.dart';

class RickCharactersPage extends StatelessWidget {
  final scrollController = ScrollController();
  final rickBloc = GetIt.I<RickCharactersBloc>();

  RickCharactersPage({super.key});

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          rickBloc.add(const RickCharactersEvent(loadCharacters: true));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    rickBloc.add(const RickCharactersEvent(loadCharacters: true));

    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty Characters"),
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return StreamBuilder<RickCharactersState>(
        stream: rickBloc.stream,
        builder: (context, snapshot) {
          RickCharactersState? state = snapshot.data;
          if (state is RickCharactersLoading && state.isFirstFetch) {
            return _loadingIndicator();
          }

          List<RickCharacter> character = [];
          bool isLoading = false;

          if (state is RickCharactersLoading) {
            character = state.oldRickCharacters;
            isLoading = true;
          } else if (state is RickCharactersLoaded) {
            character = state.rickCharacters;
          }

          return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < character.length)
                return _character(character[index], context);
              else {
                Timer(Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });

                return _loadingIndicator();
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[400],
              );
            },
            itemCount: character.length + (isLoading ? 1 : 0),
          );
        });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _character(RickCharacter character, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        height: 100,
        child: Row(children: [
          Image.network(
            character.image ?? "",
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            alignment: Alignment.topRight,
            loadingBuilder: (context, child, loadingProgress) {
               if (loadingProgress == null) return child;

              return Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.white,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(color: Colors.red),
                          ))));
              // You can use LinearProgressIndicator or CircularProgressIndicator instead
            },
            errorBuilder: (context, error, stackTrace) =>
                const Text('Some errors occurred!'),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                "${character.id}. ${character.name}",
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible,
              )),
              const SizedBox(height: 10.0),
              Text(character.status ?? "")
            ],
          ),
        ]));
  }
}
