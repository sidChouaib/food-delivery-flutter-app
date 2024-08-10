import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/responsive.dart';
import '../../data/service/firebase_signin_service.dart';
import '../../model_view/sign_in_bloc/sign_in_bloc.dart';
import 'widget/background.dart';
import 'widget/login_form.dart';
import 'widget/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInBloc(signInService: FirebaseSignInService(), context: context),
      child: Padding(
        padding: EdgeInsets.only(
         bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Background(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: const MobileLoginScreen(),
              desktop: Row(
                children: [
                  const Expanded(
                    child: LoginScreenTopImage(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 450,
                          child: LoginForm(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}