import 'package:ecom_b/features/home_screen/view/home_screen.dart';
import 'package:ecom_b/features/login_screen/login_screen.dart';
import 'package:ecom_b/features/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:ecom_b/features/splash_screen/bloc/splash_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (BuildContext context, state) {
        if (state is SplashScreenSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is SplashScreenFailure) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: const Scaffold(body: Column()),
    );
  }
}
