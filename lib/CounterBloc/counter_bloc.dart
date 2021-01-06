import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_package/CounterBloc/counter_event.dart';
import 'package:flutter_block_package/CounterBloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState(0));



  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
      if (event is Increase){
      yield CounterState(state.counter + 1 );
      }
      if (event is Decrease){
        yield CounterState(state.counter - 1 );
      }
  }

}