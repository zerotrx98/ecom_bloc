import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_b/features/splash_screen/bloc/splash_screen_event.dart';
import 'package:ecom_b/features/splash_screen/bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<CheckLoginStatus>((event, emit) async {
      emit(SplashScreenLoading());
      await Future.delayed(const Duration(seconds: 2));
      final user = auth.currentUser;
      if (user != null) {
        emit(SplashScreenSuccess());
      } else {
        emit(SplashScreenFailure());
      }
    });
  }
}
