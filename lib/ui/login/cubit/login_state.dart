part of 'login_cubit.dart';

enum Status { initial, loading, success, failure }

class LoginState {
  final Status? status;
  final String? email;
  final String? password;
  final String? error;

  const LoginState({
    this.email,
    this.password,
    this.status = Status.initial,
    this.error,
  });

  //metodo copyWith
  LoginState copyWith({
    String? email,
    String? password,
    Status? status,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
