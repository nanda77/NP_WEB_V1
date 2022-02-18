import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterEvent {}

class CounterBloc extends Bloc{
  final _streamController = StreamController<String>.broadcast();

  Stream<String> get counterStream => _streamController.stream;

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 600;

  int currentSeconds = 0;

  // String get timerText => '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  CounterBloc(int initialState) : super(0);

/*  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if(event is CounterRefreshEvent){
      var duration = interval;
      Timer.periodic(duration, (timer) {
          print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    }
  }*/

  changeCounter(){
    var duration = interval;
    Timer.periodic(duration, (timer) {
      print(timer.tick);
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
      _streamController.sink.add('${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}');
    });
  }

}