import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../constants/color_constants.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc(): super( const CountState(number: 0)){
    on<CountEvent>(_count);
  }
  int _obxCount = 0;

  void _count(
      CountEvent event, Emitter<CountState> emit) async {
    try {
      if(event.counter == Counter.increment){
        _increment();
      }else{
        _decrement();
      }
      emit(
        CountState(
            number: _obxCount
        ),
      );
    } catch (error) {

    }
  }
  void _increment() {
    _obxCount++;
    if (_obxCount >= 1 && _obxCount <= 1) {
      Get.snackbar(
        'Incremented',
        'Count incremented to ${_obxCount.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else if (_obxCount % 2 == 0) {
      Get.snackbar('Even Count', 'Even number is ${_obxCount.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
    } else if (_obxCount % 5 == 0) {
      Get.bottomSheet(Container(
        height: 150,
        color: AppColors.spaceBlue,
        child: Center(
            child: Text(
              'Count has reached ${_obxCount.toString()}',
              style: const TextStyle(fontSize: 28.0, color: Colors.white),
            )),
      ));
    }
  }

  void _decrement() {
    _obxCount--;
    if (_obxCount <= 0) {
      _obxCount = 0;
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: 'Brr No Negative',
        middleText: 'You cannot decrement counter into negative number',
        textConfirm: 'Okay',
        confirm: OutlinedButton.icon(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.check,
            color: Colors.blue,
          ),
          label: const Text(
            'Okay',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
    }
  }

// void simpleDecrement() {
//   simpleCount--;
// }
//
// void simpleIncrement() {
//   simpleCount++;
// }
}
