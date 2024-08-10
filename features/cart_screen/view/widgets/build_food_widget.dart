import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/features/cart_screen/view/widgets/foodlist_item_widget.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildFoodWidget extends StatelessWidget {
  const BuildFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Text(
                  "Total ${state.orderItems.length.toString()} items",
                  style: CustomTextStyles.bodyMediumBluegray300,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildFoodList(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildFoodList(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List orderItems = state.orderItems;
        print(orderItems);
        return orderItems.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: orderItems.length,
                  itemBuilder: (context, index) {
                    return FoodlistItemWidget(orderItem: orderItems[index]);
                  },
                ),
              )
            : const Text('no data');
      },
    );
  }
}
