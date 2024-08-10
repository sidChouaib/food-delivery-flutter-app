part of 'sign_up_bloc.dart';

abstract class SignUpState {
  const SignUpState();

}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {
  final String? message;

  SignUpLoadingState({this.message});

  
}

class SignUpSuccessState extends SignUpState {
  
}

class SignUpFailureState extends SignUpState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});

}
