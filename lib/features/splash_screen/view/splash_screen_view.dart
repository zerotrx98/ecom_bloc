import 'package:ecom_b/features/home_screen/view/home_screen.dart';
import 'package:ecom_b/features/login_screen/login_screen.dart';
import 'package:ecom_b/features/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(CheckLoginStatus()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (BuildContext context, state) {
          if (state is SplashScreenSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else if (state is SplashScreenFailure) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  LoginScreen()));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                  child: const Icon(Icons.shopping_bag, size: 55, color: Colors.deepPurple),
                ),

                const SizedBox(height: 25),

                const Text(
                  "E-Commerce",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text("Loading...", style: TextStyle(color: Colors.white70)),

                const SizedBox(height: 30),

                const CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
