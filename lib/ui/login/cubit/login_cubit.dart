import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepository = AuthRepositoryImpl();

  void onEmailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  Future<void> onLogin() async {
    if (state.email == null || state.password == null) {
      emit(state.copyWith(error: 'Email and password cannot be empty'));
      return;
    }

    try {
      await _authRepository.signIn(state.email!, state.password!);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: Status.failure));
    }
  }
}
