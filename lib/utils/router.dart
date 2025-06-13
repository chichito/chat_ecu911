import 'package:chat_ecu911/screens/home_screen.dart';
import 'package:chat_ecu911/screens/login_screen.dart';
import 'package:chat_ecu911/screens/register_screen.dart';

final router = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
};
