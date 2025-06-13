import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
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
                        onPressed: () {},
                        child: Text(
                          "Sign up withn mail",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
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
                    Text("Existing account? Log in"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
