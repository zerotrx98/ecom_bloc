part of 'splash_screen_bloc.dart';

sealed class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashScreenSuccess extends SplashScreenState {}

class SplashScreenFailure extends SplashScreenState {}
