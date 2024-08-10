import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:flutter/material.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        // Text(
        //   "Sign Up".toUpperCase(),
        //   style: const TextStyle(
        //     fontSize: 25,
        //     fontWeight: FontWeight.bold
        //     ),
        // ),
        // const SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 220,
              width: 320,
              child: Image.asset("assets/images/Wallet-2.png"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
