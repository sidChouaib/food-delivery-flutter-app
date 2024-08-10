import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';

import 'food_invocation_repo.dart';

class FoodInvocationRepoImpl implements FoodDetailsRepo {
  @override
  int decrementNumberProduct(int num) {
    if (num > 1) num = num - 1;
    return num;
  }

  @override
  int incrementNumberProduct(int num) {
    return num + 1;
  }

  @override
  double calculateTotal(List<OrderItem> orderItems) {
    double billTotal = 0;
    orderItems.forEach((orderItem) {
      double? itemTotalPrice = orderItem.product.price! * orderItem.quantity;
      billTotal = billTotal + itemTotalPrice;
    });
    print(billTotal);
    return billTotal;
  }
}
