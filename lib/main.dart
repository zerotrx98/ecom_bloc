import 'package:ecom_b/features/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/splash_screen/bloc/splash_screen_event.dart';
import 'features/splash_screen/view/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenBloc()..add(CheckLoginStatus()),
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreenView()),
    );
  }
}
