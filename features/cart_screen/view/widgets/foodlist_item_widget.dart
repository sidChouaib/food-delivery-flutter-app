import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FoodlistItemWidget extends StatelessWidget {
  final OrderItem orderItem;
  const FoodlistItemWidget({Key? key, required this.orderItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currency = context.read<CartBloc>().currency.toString();

    double widthIcon = 25;
    bool isVisible = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 102,
          width: 102,
          decoration: BoxDecoration(
            color: appTheme.blueGray50,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: CustomImageView(
            imagePath: orderItem.product.foodImageUrl,
            height: 102,
            width: 102,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 9,
            bottom: 5,
          ),
          child: Column(
            children: [
              Container(
                width: 212,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        orderItem.product.name.toString(),
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    CustomImageView(
                      // imagePath: ImageConstant.imgMoreVertical,
                      height: 23,
                      width: 23,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 213,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      margin: const EdgeInsets.only(
                        top: 1,
                        bottom: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgStar1,
                            height: 16,
                            width: 16,
                            margin: const EdgeInsets.only(bottom: 1),
                          ),
                          Text(
                            orderItem.product.foodRate.toString(),
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "$currency ${orderItem.product.price}",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 213,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        // We chould be add the size in orderItem

                        orderItem.product.size![1].toString(),
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 90,
                      height: 48,
                      child: isVisible
                          // Show Butons Of Incremnet and Decremnet
                          ? Row(
                              children: [
                                CustomIconButton(
                                  width: widthIcon,
                                  height: widthIcon,
                                  decoration: BoxDecoration(
                                    color: appTheme.lightBlue400,
                                    borderRadius: BorderRadiusStyle
                                        .circleBorder24, /* border: Border.all(color: appTheme.lightBlue) */
                                  ),
                                  child: Icon(Icons.remove,
                                      color: appTheme.whiteA700),
                                  onTap: () {
                                    // context.read<CounterBloc>().add(DecreamentEvent());
                                  },
                                ),
                                const Spacer(),
                                Text(
                                  //call the value of counter from CounterChangedState and print it in UI
                                  '1',
                                  style: CustomTextStyles.titleMediumGray90001,
                                ),
                                const Spacer(),
                                CustomIconButton(
                                  width: widthIcon,
                                  height: widthIcon,
                                  bkColor: appTheme.whiteA700,
                                  decoration: BoxDecoration(
                                    color: appTheme.lightBlue400,
                                    borderRadius: BorderRadiusStyle
                                        .circleBorder24, /* border: Border.all(color: appTheme.lightBlue) */
                                  ),
                                  child: Icon(Icons.add,
                                      color: appTheme.whiteA700),
                                  onTap: () {
                                    //   context.read<CounterBloc>().add(IncreamentEvent());
                                  },
                                ),
                              ],
                            )
                          : // Show number of items
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text('${orderItem.quantity} Item(s)',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(color: appTheme.blueGray300),
                                  textAlign: TextAlign.end),
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
