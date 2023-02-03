part of 'count_bloc.dart';

enum Counter { increment, decrement }

class CountEvent {
  const CountEvent({required this.counter});

  final Counter counter;
}
