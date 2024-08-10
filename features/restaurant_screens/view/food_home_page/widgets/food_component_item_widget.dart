import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:cibweb/features/foods_screens/view/food_details/food_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore: must_be_immutable
class FoodcomponentItemWidget extends StatelessWidget {
  final ProductModel? product;
  const FoodcomponentItemWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 155,
      child: InkWell(
        onTap: () =>
            // Show BottomSheet when the button is tapped
            showFlexibleBottomSheet(
          bottomSheetBorderRadius: BorderRadiusStyle.roundedTopBorder32,
          minHeight: 0,
          initHeight: 0.95,
          maxHeight: 0.95,
          context: context,
          isExpand: true,
          builder: (context, scrollController, bottomSheetOffset) {
            return FoodDetailScreen(
              product: product,
            );
          },
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder25,
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgFoodItemBackground,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: 80,
                      child: Text(
                        "\n\n${product?.name}",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product?.category ?? "category",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 4,
                          ),
                          child: Text(
                            product?.price.toString() ?? "0",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        const CustomIconButton(
                          height: 30,
                          width: 30,
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              width: 90,
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadius.circular(
                  90,
                ),
              ),
              child: CustomImageView(
                imagePath: product!.foodImageUrl,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
