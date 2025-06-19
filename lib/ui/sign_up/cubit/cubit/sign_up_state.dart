part of 'sign_up_cubit.dart';

class SignUpState {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool passwordsMatch;

  SignUpState({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.passwordsMatch = true,
  });
  //metodo copyWith
  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? passwordsMatch,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passwordsMatch: passwordsMatch ?? this.passwordsMatch,
    );
  }
}
