import 'package:bloc/bloc.dart';
import 'package:chat_ecu911/domain/models/contact.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetContactsEvent>((event, emit) {
      // TODO: implement event handler
      print("GetContactsEvent triggered");
    });
  }
}
