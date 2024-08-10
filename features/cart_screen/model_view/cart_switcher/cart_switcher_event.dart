part of 'cart_switcher_bloc.dart';

sealed class CartSwitcherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CartSwitcherUpdatedEvent extends CartSwitcherEvent {
  final int index;
  CartSwitcherUpdatedEvent(this.index);
}
