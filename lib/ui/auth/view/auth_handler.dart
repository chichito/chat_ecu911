import 'package:chat_ecu911/ui/auth/bloc/auth_bloc.dart';
import 'package:chat_ecu911/ui/core/navigation/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // implementar la navegación para mostrar el onboarding/home
        switch (state) {
          case AuthStateLoggedIn():
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppNavigator.home,
              (route) => false,
            );
            break;
          case AuthStateLoggedOut():
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppNavigator.onboarding,
              (route) => false,
            );
            break;
          default:
        }
      },
      child: child,
    );
  }
}
