import 'package:chat_ecu911/ui/core/ui/colors.dart';
import 'package:chat_ecu911/ui/core/ui/widgets/onboarding_divider.dart';
import 'package:chat_ecu911/ui/core/ui/widgets/social_media_button.dart';
import 'package:chat_ecu911/ui/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) {
          return previous.status != current.status;
        },
        listener: (context, state) {
          if (state.status == Status.failed) {
            Fluttertoast.showToast(
              msg: 'Algo salió mal. Intenta nuevamente ...',
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Log in',
                style: textTheme.labelLarge?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 10,
                  decorationColor: theme.colorScheme.primary.withOpacity(0.7),
                ),
                children: [
                  TextSpan(text: ' to Chateo', style: textTheme.labelLarge),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome back! Sign in using your social account or email to continue us',
              style: TextStyle(color: AppColors.darkGrey),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  SocialMediaButton(iconPath: 'assets/icons/facebook.png'),
                  SocialMediaButton(iconPath: 'assets/icons/google.png'),
                  SocialMediaButton(
                    iconPath: 'assets/icons/apple.png',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            OnboardingDivider(color: AppColors.darkGrey),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(label: Text('Your email')),
              onChanged: cubit.onEmailChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16),
            TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
              onChanged: cubit.onPasswordChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(bottom: 20 + keyboardHeight),
          child: ElevatedButton(
            onPressed: () {
              cubit.loginAccount();
            },
            child: const Text('Log in'),
          ),
        ),
      ),
    );
  }
}
