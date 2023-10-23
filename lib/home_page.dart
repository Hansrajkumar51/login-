import 'package:class_task/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getWelcomeMessage(String username) {
    if (username == "hansraj") {
      return "Welcome, Lord $username";
    }
    return "Welcome, $username";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text('logout')),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: Text(getWelcomeMessage(widget.username)),
          ),
        ],
      ),
    );
  }
}
