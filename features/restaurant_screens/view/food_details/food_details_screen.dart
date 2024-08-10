import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:cibweb/features/foods_screens/model_view/counter_food/counter_bloc.dart';
import 'package:cibweb/features/foods_screens/view/food_details/widgets/ingridents_item_widget.dart';
import 'package:cibweb/features/foods_screens/view/food_details/widgets/size_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/widgets/custom_button.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailScreen extends StatelessWidget {
  final ProductModel? product;
  const FoodDetailScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CounterBloc>().add(ResetEvent());
    double widthIcon = 30;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildFoodimage(context),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFoodName(context),
                          const SizedBox(height: 12),
                          _buildreviewIformation(context),
                          const SizedBox(height: 12),
                          _buildSizeInformation(context),
                          const SizedBox(height: 12),
                          Text(
                            "ingredients".toUpperCase(),
                            style: CustomTextStyles.bodyMediumBluegray900,
                          ),
                          const SizedBox(height: 12),
                          _buildIngredientText(context),
                          const SizedBox(height: 12),
                          Text(
                            "Optionel".toUpperCase(),
                            style: CustomTextStyles.bodyMediumBluegray300,
                          ),
                          const SizedBox(height: 12),
                          _buildIngredientIcon(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _addToCartWidget(context, widthIcon)
        ],
      ),
    );
  }


  /// Section Widget of Food Name
  Widget _buildFoodName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product?.name ?? "Food Name",
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }

  /// Section Widget Ingredient
  Widget _buildIngredientText(BuildContext context) {
    List<String>? ingredients = product?.ingredients;
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 40,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ingredients?.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: AppDecoration.fillblueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Container(
              decoration: AppDecoration.fillblueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  ingredients![index],
                  style: CustomTextStyles.bodyMediumBluegray300,
                ),
              ),
            ),
          );
        });
  }
}
