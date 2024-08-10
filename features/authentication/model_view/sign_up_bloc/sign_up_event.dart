part of 'sign_up_bloc.dart';


abstract class SignUpEvent {
  const SignUpEvent();
  
}

class SignUpRequested extends SignUpEvent {
  final UserModel user;
  
  SignUpRequested({required this.user});
  
}

class SignUpLoading extends SignUpEvent {}

class SignUpResult extends SignUpEvent {
  final bool isSuccess;
  final String errorMessage;

  SignUpResult({required this.isSuccess, this.errorMessage = 'There is an error, Im the one printing this message'});

}
