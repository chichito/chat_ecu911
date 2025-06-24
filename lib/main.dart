import 'package:chat_ecu911/firebase_options.dart';
import 'package:chat_ecu911/ui/core/navigation/app_navigator.dart';
import 'package:chat_ecu911/ui/core/themes/theme.dart';
import 'package:chat_ecu911/ui/login/cubit/login_cubit.dart';
import 'package:chat_ecu911/ui/login/view/login_page.dart';
import 'package:chat_ecu911/ui/onboarding/cubit/onboarding_cubit.dart';
import 'package:chat_ecu911/ui/onboarding/view/onboarding_page.dart';
import 'package:chat_ecu911/ui/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_ecu911/ui/sign_up/view/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        AppNavigator.main: (_) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: OnboardingPage(),
        ),
        AppNavigator.login: (_) =>
            BlocProvider(create: (context) => LoginCubit(), child: LoginPage()),
        AppNavigator.signUp: (_) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: SignUpPage(),
        ),
      },
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
