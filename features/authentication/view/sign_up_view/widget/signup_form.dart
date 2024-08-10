import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/widgets/custom_button.dart';
import 'package:cibweb/features/authentication/data/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../model_view/sign_up_bloc/sign_up_bloc.dart';
import '../../login_view/login_screen.dart';
import '../../login_view/widget/already_have_an_account_acheck.dart';
import 'or_divider.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: fullNameController,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon:
                  Icon(Icons.person_2_outlined, color: appTheme.blueGray600),
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
          const SizedBox(height: 15),
          TextFormField(
            controller: ageController,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              prefixIcon: Icon(Icons.numbers, color: appTheme.blueGray600),
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
          const SizedBox(height: 15),
          TextFormField(
            controller: phoneNumberController,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.phone_android_outlined,
                  color: appTheme.blueGray600),
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
          const SizedBox(height: 15),
          TextFormField(
            controller: emailController,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
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

          const SizedBox(height: 15),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            // obscureText: true,
            // style: TextStyle(color: appTheme.lightBlue),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock, color: appTheme.blueGray600),
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
          // const SizedBox(height: 20),
          const SizedBox(height: defaultPadding * 2),
          CustomButton(
            onTap: () {
              UserModel enteredUserSignUpInfo = UserModel(
                  userName: fullNameController.text,
                  userAge: int.tryParse(ageController.text) ?? 0,
                  userPhoneNumber:
                      int.tryParse(phoneNumberController.text) ?? 0,
                  userEmail: emailController.text,
                  userPassword: passwordController.text);

              BlocProvider.of<SignUpBloc>(context).add(SignUpRequested(
                user: enteredUserSignUpInfo,
              ));

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return AccessScanner();
              //   }),
              // );
            },
            height: 62,
            width: double.maxFinite,
            bkColor: appTheme.lightBlue400,
            child: Center(
              child: Text(
                "Sign Up",
                style: CustomTextStyles.titleLargeWhite,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: appTheme.lightBlue400,
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset("assets/icons/facebook.svg",
                    height: 20, width: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: appTheme.lightBlue400,
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset("assets/icons/twitter.svg",
                    height: 20, width: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: appTheme.lightBlue400,
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset("assets/icons/google-plus.svg",
                    height: 20, width: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

//   @override
// void dispose() {
//   fullNameController.dispose();
//   ageController.dispose();
//   phoneNumberController.dispose();
//   emailController.dispose();
//   passwordController.dispose();
//   super.dispose();
// }
}
