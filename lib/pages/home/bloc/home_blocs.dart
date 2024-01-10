import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/pages/home/bloc/home_events.dart';
import 'package:language_app/pages/home/bloc/home_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates>{
  HomePageBlocs():super(const HomePageStates()){
    on<HomePageDots>(_homePageDots);
  }
  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit){
    emit(state.copyWith(index: event.index));
  }
}