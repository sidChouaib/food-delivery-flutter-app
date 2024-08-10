part of 'cart_switcher_bloc.dart';

sealed class CartSwitcherState extends Equatable {
  final int index;
  const CartSwitcherState(this.index);

  @override
  List<Object> get props => [index];
}

final class CartSwitcherInitial extends CartSwitcherState {
  CartSwitcherInitial() : super(0);
}

final class CartSwitcherUpdatedState extends CartSwitcherState {
  final int index;
  CartSwitcherUpdatedState(this.index) : super(index);
}
