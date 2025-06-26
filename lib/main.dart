import 'package:chat_ecu911/firebase_options.dart';
import 'package:chat_ecu911/ui/auth/bloc/auth_bloc.dart';
import 'package:chat_ecu911/ui/auth/view/auth_handler.dart';
import 'package:chat_ecu911/ui/core/navigation/app_navigator.dart';
import 'package:chat_ecu911/ui/core/themes/theme.dart';
import 'package:chat_ecu911/ui/home/bloc/home_bloc.dart';
import 'package:chat_ecu911/ui/home/view/home_page.dart';
import 'package:chat_ecu911/ui/login/cubit/login_cubit.dart';
import 'package:chat_ecu911/ui/login/view/login_page.dart';
import 'package:chat_ecu911/ui/onboarding/cubit/onboarding_cubit.dart';
import 'package:chat_ecu911/ui/onboarding/view/onboarding_page.dart';
import 'package:chat_ecu911/ui/root/view/root_page.dart';
import 'package:chat_ecu911/ui/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_ecu911/ui/sign_up/view/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//comando para generar la huella  dentro de la carpeta android  ./gradlew signingReport
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckUserEvent()),
      child: AuthHandler(
        navigatorKey: navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Material App',
          routes: {
            // reemplaza al home
            AppNavigator.main: (_) => RootPage(),
            AppNavigator.onboarding: (_) => BlocProvider(
              create: (context) => OnboardingCubit(),
              child: OnboardingPage(),
            ),
            AppNavigator.login: (_) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ),
            AppNavigator.signUp: (_) => BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignUpPage(),
            ),
            AppNavigator.home: (_) => BlocProvider(
              lazy: false,
              create: (context) => HomeBloc()..add(GetContactsEvent()),
              child: HomePage(),
            ),
          },
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
