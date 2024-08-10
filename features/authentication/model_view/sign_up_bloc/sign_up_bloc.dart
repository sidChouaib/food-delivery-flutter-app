import 'package:cibweb/features/scanner_access_page/view/access_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/service/firebase_signup_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  FirebaseSignUpService signUpService = FirebaseSignUpService();
  final BuildContext context;

  // final FirebaseAuthService authService;
  SignUpBloc({
    required this.signUpService,
    required this.context,
  }) : super(SignUpInitial()) {
    on<SignUpRequested>((event, emit) async {
      await _mapSignUpRequestedToState(event, emit);
    });
  }
  Future _mapSignUpRequestedToState(
      SignUpRequested event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());

    try {
      UserCredential userCredential =
          await signUpService.signUpWithEmailAndPassword(
        email: event.user.userEmail,
        password: event.user.userPassword,
      );

      emit(SignUpLoadingState());

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AccessScanner(),
        ),
      );

      await signUpService.storeUserInfos(
          userCredential: userCredential,
          fullName: event.user.userName!,
          age: event.user.userAge!,
          phoneNumber: event.user.userPhoneNumber!,
          email: event.user.userEmail,
          password: event.user.userPassword);

      emit(SignUpSuccessState());
    } catch (e) {
      // If signup fails, emit SignUpFailureState with an error message
      emit(SignUpFailureState(errorMessage: 'Signup failed: $e'));
    }
  }
}
