import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String routeName = "login";

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "SignUp");
                },
                child: Text("Sign up")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "home");
                },
                child: Text("Home")),
          ],
        ),
      ),
    );
  }
}
