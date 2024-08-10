import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/responsive.dart';
import '../../data/service/firebase_signup_service.dart';
import '../../model_view/sign_up_bloc/sign_up_bloc.dart';
import '../login_view/widget/background.dart';
import 'widget/sign_up_top_image.dart';
import 'widget/signup_form.dart';

class SignUpScreen extends StatelessWidget {
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
          signUpService: FirebaseSignUpService(),
          context: context),
      child: Padding(
         padding: EdgeInsets.only(
         bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const Background(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: MobileSignupScreen(),
              desktop: Row(
                children: [
                  Expanded(
                    child: SignUpScreenTopImage(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 450,
                          child: null,
                        ),
                        SizedBox(height: defaultPadding / 2),
                        // SocalSignUp()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            const Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
