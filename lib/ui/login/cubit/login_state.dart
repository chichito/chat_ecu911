part of 'login_cubit.dart';

enum Status { initial, loading, success, failed }

class LoginState {
  final Status? status;
  final String? email;
  final String? password;

  const LoginState({this.email, this.password, this.status = Status.initial});

  //metodo copyWith
  LoginState copyWith({String? email, String? password, Status? status}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
