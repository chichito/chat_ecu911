import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  void onNameChanged(String? name) {
    emit(state.copyWith(name: name));
  }

  void onEmailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String? confirmPassword) {
    final isMatch = confirmPassword == state.password;
    emit(
      state.copyWith(confirmPassword: confirmPassword, passwordsMatch: isMatch),
    );
  }

  void createAccount() {
    // Aquí puedes agregar la lógica para crear una cuenta
    // Por ejemplo, llamar a un servicio de autenticación
    // y manejar el resultado.
    print(
      'Creating account with: '
      'Name: ${state.name}, '
      'Email: ${state.email}, '
      'Password: ${state.password}, '
      'Confirm Password: ${state.confirmPassword}',
    );
  }
}
