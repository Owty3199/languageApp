import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/app_event.dart';
import 'package:language_app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc():super(InitState()){

    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter+1));
      print(state.counter);

    });

     on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter-2));
      print(state.counter);


    });
  }

}