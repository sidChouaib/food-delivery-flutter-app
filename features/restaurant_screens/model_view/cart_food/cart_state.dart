part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List<OrderItem> orderItems;
  final double billTotla;

  const CartState({required this.orderItems, required this.billTotla});

  @override
  List<Object> get props => [orderItems, billTotla];
}

final class CartInitial extends CartState {
  const CartInitial({required List orderItems})
      : super(orderItems: const [], billTotla: 0);
}

class CartChangedState extends CartState {
  const CartChangedState(
      {required List<OrderItem> orderItems, required double billTotla})
      : super(orderItems: orderItems, billTotla: billTotla);
}
