import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherblocObsever extends BlocObserver{
@override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print('event bloc : ${event}');
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print('ontrans bloc : ${transition}');
  }
@override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print('errro bloc : ${error}');
  }
}