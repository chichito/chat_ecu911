import 'package:chat_ecu911/screens/login_screen.dart';
import 'package:chat_ecu911/screens/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/icons/icon_app.png'),
                      Text(
                        'Connect friends easily & quickly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 68,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Our chat app is the perfect way to stay connected with friends and family.',
                        style: TextStyle(
                          color: Color(0xFFB9C1BE),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/facebook.png'),
                          Image.asset('assets/icons/google.png'),
                          Image.asset('assets/icons/apple.png'),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xFFCDD1D0),
                              thickness: 0.5,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFFCDD1D0),
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            //padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            print('Sign up with email');
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.routeName,
                            );
                          },
                          child: Text(
                            "Sign up with emaill",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Existing account?',
                            style: TextStyle(
                              color: Color(0xFFB9C1BE),
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: ' Log in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
