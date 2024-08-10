part of 'cart_bloc.dart';

sealed class CarteEvent {}

class AddToCartEvent extends CarteEvent {
  final OrderItem orderItem;

  AddToCartEvent({required this.orderItem});
}

class UpdateCartEvent extends CarteEvent {}

class RemoveFromCartEvent extends CarteEvent {}
