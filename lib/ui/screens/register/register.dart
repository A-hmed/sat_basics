import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static const routeName = "register";

  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Register"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Login")),
          ElevatedButton(onPressed: () {}, child: Text("Home")),
        ],
      ),
    );
  }
}
