import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void loginAccount() async {
    try {
      emit(state.copyWith(status: Status.loading));
      await Future.delayed(Duration(seconds: 3));
      await _authRepository.signIn(state.email!, state.password!);
      emit(state.copyWith(status: Status.success));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        default:
          emit(state.copyWith(status: Status.failed));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
    }
  }
}
