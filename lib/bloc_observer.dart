import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserve implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint('close $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint('create $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    debugPrint('Error $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
