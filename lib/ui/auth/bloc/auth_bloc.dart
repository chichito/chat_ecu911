import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = AuthRepositoryImpl();

  AuthBloc() : super(AuthStateLoading()) {
    on<CheckUserEvent>((event, emit) {
      // logica para escuchar el estado de la auth
      return emit.forEach(
        _authRepository.currentUser,
        onData: (user) {
          if (user == null) {
            // Emitir que no tenemos usuario logueado
            return AuthStateLoggedOut();
          } else {
            return AuthStateLoggedIn(user: user);
          }
        },
      );
    });
  }
}
