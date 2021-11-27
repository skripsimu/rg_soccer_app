import 'package:bloc/bloc.dart';

class RGBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition ()=> $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError ()=> $error');
    super.onError(bloc, error, stackTrace);
  }
}
