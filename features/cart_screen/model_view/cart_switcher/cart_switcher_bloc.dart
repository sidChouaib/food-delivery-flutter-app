import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_switcher_event.dart';
part 'cart_switcher_state.dart';

class CartSwitcherBloc extends Bloc<CartSwitcherEvent, CartSwitcherState> {
  CartSwitcherBloc() : super(CartSwitcherInitial()) {
    on<CartSwitcherEvent>((event, emit) {
      if (event is CartSwitcherUpdatedEvent) {
        print(event.index);
        print(state.index);
        emit(CartSwitcherUpdatedState(event.index));
      }
    });
  }
}
