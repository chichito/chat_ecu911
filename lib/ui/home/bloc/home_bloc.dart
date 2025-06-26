import 'dart:async';
import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:chat_ecu911/data/repositories/contacts/contacts_repository_impl.dart';
import 'package:chat_ecu911/domain/models/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _authRepository = AuthRepositoryImpl();
  final _contactsRepository = ContactsRepositoryImpl();

  HomeBloc() : super(HomeState()) {
    on<GetContactsEvent>(_onGetContacsEvent);
    on<UpdateUserStatus>(_onUpdateUserStatus);
  }

  FutureOr<void> _onGetContacsEvent(
    GetContactsEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      _contactsRepository.getContacts(),
      onData: (contacts) {
        return state.copyWith(contacts: contacts);
      },
    );
  }

  FutureOr<void> _onUpdateUserStatus(
    UpdateUserStatus event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authRepository.currentUser.first;
    // if (user == null) return;
    if (user != null) {
      _contactsRepository.updateUserStatus(user, event.status);
    }
  }
}
