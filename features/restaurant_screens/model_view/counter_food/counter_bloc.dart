// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cibweb/features/foods_screens/data/repo/food_invocation_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 1;
    on<CounterEvent>((event, emit) {
      //We can put our methods right here
      //But we prefer to write them seperately in food_details_repo_impliment then call them here when needed.

      if (event is IncreamentEvent) {
        counter = FoodInvocationRepoImpl().incrementNumberProduct(counter);
        //We send the counter variable with the new state which called "CounterChangedState"
        emit(CounterChangedState(counter: counter));
      } else if (event is DecreamentEvent) {
        if (counter > 1) {
          counter = FoodInvocationRepoImpl().decrementNumberProduct(counter);
          emit(CounterChangedState(counter: counter));
        }
      } else if (event is ResetEvent) {
        counter = 1;
        emit(CounterChangedState(counter: counter));
      }

//  if (event is DeleteEvent) {
//         if (counter == 1) {
//           counter--;
//         }
//       }
    });

    int getCounter() {
      return counter;
    }
  }
}
