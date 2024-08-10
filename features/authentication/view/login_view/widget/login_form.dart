import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/widgets/custom_button.dart';
import 'package:cibweb/features/authentication/data/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model_view/sign_in_bloc/sign_in_bloc.dart';
import '../../sign_up_view/signup_screen.dart';
import '../widget/already_have_an_account_acheck.dart';
// import 'Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: ' Email',
              prefixIcon:
                  Icon(Icons.email_outlined, color: appTheme.blueGray600),
              labelStyle: TextStyle(color: appTheme.blueGray600),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 222, 222, 238)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 222, 222, 238)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: passwordController,
            // obscureText: true,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon:
                  Icon(Icons.lock_outlined, color: appTheme.blueGray600),
              labelStyle: TextStyle(color: appTheme.blueGray600),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 222, 222, 238)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 222, 222, 238)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const SizedBox(height: defaultPadding * 2),
          CustomButton(
            onTap: () {
              // String enteredEmail = emailController.text;
              UserModel enteredUserLoginInfo = UserModel(
                  userEmail: emailController.text,
                  userPassword: passwordController.text);
              // String enteredPassword = passwordController.text;
    
              BlocProvider.of<SignInBloc>(context)
                  .add(SignInRequested(user: enteredUserLoginInfo));
            },
            height: 62,
            width: double.maxFinite,
            bkColor: appTheme.lightBlue400,
            child: Center(
              child: Text(
                "Login",
                style: CustomTextStyles.titleLargeWhite,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                    //
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
