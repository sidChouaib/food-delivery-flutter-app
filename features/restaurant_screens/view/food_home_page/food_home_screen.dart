import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/core/widgets/custom_search_view.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/category_model.dart/category_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/restaurant_response_model.dart';
import 'package:cibweb/features/foods_screens/data/repo/restaurant_repo_implimentation.dart';
import 'package:cibweb/features/foods_screens/view/food_home_page/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'widgets/food_component_item_widget.dart';

// ignore: must_be_immutable
class FoodHomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  // shouldFocusSearch=false detha bch maysautilich ll search w ykharjli code direct
  bool shouldFocusSearch = false;

  RestaurantResponseModel? restaurantResponseModel;
  FoodHomeScreen(this.restaurantResponseModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            _buildStoreBackground(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    _categoryTitleBar(context),
                    const SizedBox(height: 12),
                    _categoryItemBuilder(context, restaurantResponseModel),
                    const SizedBox(height: 19),
                    _buildProductComponent(context, restaurantResponseModel!),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottumBar(),
      ),
    );
  }

  //some code is supposed to be here
  
  return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories!.length,
          (index) => _categoryitem(context, categories[index]),
        ),
      ),
    );
  }

  Widget _buildProductComponent(
      BuildContext context, RestaurantResponseModel restRespMod) {
    List<ProductModel>? products =
        RestaurantRepoImplementation().getProductData(restRespMod);
    //print(products);y
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              "All (${products?.length ?? 0})",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 210,
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 19,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products?.length ?? 0,
            itemBuilder: (context, index) {
              return FoodcomponentItemWidget(product: products?[index]);
            },
          ),
        ),
      ],
    );
  }
}
