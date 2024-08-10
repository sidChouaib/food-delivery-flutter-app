import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';

abstract class FoodDetailsRepo {
  int incrementNumberProduct(int num);
  int decrementNumberProduct(int num);

  double calculateTotal(List<OrderItem> orderItems);
  
}
