part of 'sign_in_bloc.dart';

abstract class SignInEvent{
  const SignInEvent();

}

class SignInRequested extends SignInEvent {
  final UserModel user;

  const SignInRequested({required this.user});
}
