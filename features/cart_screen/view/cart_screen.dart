import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/widgets/app_bar/appbar_title.dart';
import 'package:cibweb/core/widgets/app_bar/custom_app_bar.dart';
import 'package:cibweb/core/widgets/custom_button.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/features/cart_screen/data/Repo/cart_repo_implimentation.dart';
import 'package:cibweb/features/cart_screen/model_view/cart_switcher/cart_switcher_bloc.dart';
import 'package:cibweb/features/cart_screen/view/widgets/build_cart_widget.dart';
import 'package:cibweb/features/cart_screen/view/widgets/build_food_widget.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/features/cib_web/data/moedel/enregistrement_order_model/enregistrement_order_model.dart';
import 'package:cibweb/features/cib_web/data/moedel/enregistrement_order_model/json_params.dart';
import 'package:cibweb/features/cib_web/data/repo/cibweb_repo_implimentation.dart';
import 'package:cibweb/features/cib_web/view/model_view/bloc/payment_state_bloc.dart';
import 'package:cibweb/features/cib_web/view/view/cib_web_web_view.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 28),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomAppBar(
                  leadingWidth: 45,
                  leading: CustomIconButton(
                      onTap: () => Navigator.pop(context),
                      height: 45,
                      width: 45,
                      decoration: IconButtonStyleHelper.fillWhiteA,
                      child: Icon(Icons.arrow_back_ios,
                          color: appTheme.lightBlue400)),
                  title: AppbarTitle(
                    text: 'Cart',
                    margin: EdgeInsets.only(left: 12),
                  ),
                ),
              ),
              _itemsAndInfoButon(context),
              const SizedBox(height: 20),
              BlocBuilder<CartSwitcherBloc, CartSwitcherState>(
                builder: (context, state) {
                  print(state.index);
                  return IndexedStack(
                    index: state.index,
                    children: [BuildFoodWidget(), BuildCartWidget()],
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _payNow(context),
    ));
  }

  Widget _buildCategoryItem({
    required BuildContext context,
    required String categoryName,
    required int categoryIndex,
  }) {
    return Expanded(
        child: InkWell(
      onTap: () {
        context
            .read<CartSwitcherBloc>()
            .add(CartSwitcherUpdatedEvent(categoryIndex));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: AppDecoration.fillblueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            categoryName,
            style: CustomTextStyles.bodyMediumBluegray300,
          ),
        ),
      ),
    ));
  }

  Widget _payNow(
    BuildContext context,
  ) {
    String currency = context.watch<CartBloc>().currency.toString();
    //BlocBuilder  listens to a specified Bloc(CounterBloc) and rebuilds itself whenever the state of that Bloc changes.
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          decoration: AppDecoration.shadow.copyWith(
            color: const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadiusStyle.roundedTopBorder32,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          height: 140,
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",
                        style: CustomTextStyles.bodyMediumBluegray300),
                    Text(
                        // Total of bill
                        "$currency ${state.billTotla.toString()}",
                        style: CustomTextStyles.titleLargeGray90001),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onTap: () async {
                

                    SATIM PAYMEN METHOD HERE

 
                      if (PaymentStateBloc().paymentState == '200') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Payment Successful'),
                              content: Column(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 60,
                                  ),
                                  SizedBox(height: 10),
                                  Text('Thank you for your payment!'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                  height: 62,
                  width: double.maxFinite,
                  bkColor: appTheme.lightBlue400,
                  child: Center(
                    child: Text(
                      "Pay Now ",
                      style: CustomTextStyles.titleLargeWhite,
                    ),
                  ),
                ),
              ]),
        );
      },
    );
  }
}
