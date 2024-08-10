import 'package:bloc/bloc.dart';
import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';
import 'package:cibweb/features/foods_screens/data/repo/food_invocation_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CarteEvent, CartState> {
  String currency = "\$";

  CartBloc() : super(CartInitial(orderItems: [])) {
    List<OrderItem> updatedOrderItems;
    double billTotal;
    on<CarteEvent>((event, emit) {
      if (event is AddToCartEvent) {
        updatedOrderItems = List.from(state.orderItems)..add(event.orderItem);
        billTotal = FoodInvocationRepoImpl().calculateTotal(updatedOrderItems);
        emit(CartChangedState(
            orderItems: updatedOrderItems, billTotla: billTotal));
      } else if (event is UpdateCartEvent) {
        // Handle updating the cart (if needed) and emit a new state
      } else if (event is RemoveFromCartEvent) {
        // Handle removing from the cart and emit a new state
      }
    });
  }
}
