import 'package:cibweb/features/authentication/data/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../scanner_access_page/view/access_scanner.dart';
import '../../data/service/firebase_signin_service.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  FirebaseSignInService signInService = FirebaseSignInService();
  final BuildContext context;

  // final FirebaseAuthService authService;
  SignInBloc({
    required this.signInService,
    required this.context,
  }) : super(SignInInitial()) {
    on<SignInRequested>((event, emit) async {
      await _mapSignUpRequestedToState(event, emit);
    });
  }
  Future _mapSignUpRequestedToState(
      SignInRequested event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());

    try {
      await signInService.signInWithEmailAndPassword(
        email: event.user.userEmail,
        password: event.user.userPassword,
      );

      emit(SignInLoadingState());

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AccessScanner(),
        ),
      );

      emit(SignInSuccessState());
    } catch (e) {
      // If signup fails, emit SignUpFailureState with an error message
      emit(SignInFailureState(errorMessage: 'Signup failed: $e'));
    }
  }
}
