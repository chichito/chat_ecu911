import 'package:chat_ecu911/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit() : super(());

  final _authRepository = AuthRepositoryImpl();

  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }

  // inicio de sesión con FB

  // Inicio de sesión con Apple ID
}
