part of 'sign_in_bloc.dart';

abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {
  final String errorMessage;

  const SignInFailureState({required this.errorMessage});
}
