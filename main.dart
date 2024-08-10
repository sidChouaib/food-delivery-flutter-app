import 'package:cibweb/features/authentication/view/login_view/login_screen.dart';
import 'package:cibweb/features/cart_screen/model_view/cart_switcher/cart_switcher_bloc.dart';
import 'package:cibweb/features/cib_web/view/model_view/bloc/payment_state_bloc.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:cibweb/features/foods_screens/model_view/counter_food/counter_bloc.dart';
import 'package:cibweb/features/scanner_access_page/view/access_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      'pk_test_51Mv1eBBdiYvpLahxl2uWKpgnVe21MBSqnmU3pvmmbWGzXBMuDvrJSeQKdbljGkhe5ou8s5Ap4qVtM3oZhvNO444Z00PPqRDGI1';
  await Stripe.instance.applySettings();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => CartSwitcherBloc()),
        BlocProvider(create: (context) => PaymentStateBloc())
      ],
      child: const MaterialApp(
        title: 'Dananir',
        home: AccessScanner(),
      ),
    );
  }
}
