import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:chat_ecu911/data/repositories/contacts/contacts_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateLoading()) {
    initialize();
  }
  final _authRepository = AuthRepositoryImpl();
  final _contactsRepository = ContactsRepositoryImpl();

  void initialize() async {
    final user = await _authRepository.currentUser.first;
    if (user != null) {
      emit(ProfileStateLoggedIn(user: user));
    }
  }

  Future<void> logOut() async {
    final state = this.state;
    if (state is ProfileStateLoggedIn) {
      await Future.wait([
        _contactsRepository.updateUserStatus(state.user, false),
        _authRepository.logOut(),
      ]);
    }
  }
}
