import 'package:chat_ecu911/firebase_options.dart';
import 'package:chat_ecu911/ui/core/navigation/app_navigator.dart';
import 'package:chat_ecu911/ui/core/themes/theme.dart';
import 'package:chat_ecu911/ui/login/view/login_page.dart';
import 'package:chat_ecu911/ui/onboarding/view/onboarding_page.dart';
import 'package:chat_ecu911/ui/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:chat_ecu911/ui/sign_up/view/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DefaultFirebaseOptions
      .currentPlatform; // Ensure the Firebase options are initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //initialRoute: AppNavigator.main, //HomeScreen.routeName,
      routes: {
        // reemplaza al home
        AppNavigator.main: (_) => OnboardingPage(),
        AppNavigator.login: (_) => LoginPage(),
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
