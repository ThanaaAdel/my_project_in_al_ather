// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wakelock/wakelock.dart';

part 'count_down_timer_state.dart';

class CountDownTimerCubit extends Cubit<CountDownTimerState> {
  CountDownTimerCubit() : super(const CountDownTimerInitial());
  Timer? timer;
  startTimer([int? time]) {
    Wakelock.enable();
    if (time != null) {
      emit(CountDownTimerProgress(time));

      print(time);
    } else {
      emit(const CountDownTimerProgress(0));
    }
    timer = Timer.periodic(const Duration(seconds: 1), onTik);
  }

  onTik(_timer) {
    if (state is CountDownTimerProgress) {
      CountDownTimerProgress wip = state as CountDownTimerProgress;
      if (wip.elapsed! > 0) {
        emit(CountDownTimerProgress(wip.elapsed! - 1));

        print("elapsed Time is ${wip.elapsed}");
      } else {
        _timer!.cancel();
        Wakelock.disable();
        emit(const CountDownTimerInitial());
      }
    }
  }
}
