import 'package:flutter/material.dart';
import 'package:class_task/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userName = TextEditingController();
  var userPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: userName,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: userPass,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true, // Hide password characters
          ),
          ElevatedButton(
            onPressed: () {
              final username = userName.text;
              final password = userPass.text;

              if (username.isEmpty && password.isEmpty) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Please enter the required fields'),
                      content: const Text(
                          'Please enter both username and password.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else if (username.isEmpty && password.isNotEmpty) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Please enter the required fields'),
                      content: const Text('Please enter username .'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else if (username.isNotEmpty && password.isEmpty) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Please enter the required fields'),
                      content: const Text('Please enter password .'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else if ((username == "admin" && password == "12345") ||
                  (username == "hansraj" && password == "12345") ||
                  (username == "arvind" && password == "12345") ||
                  (username == "kuldeep" && password == "12345") ||
                  (username == "sujal_sir" && password == "12345")) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            username: username,
                          )),
                );
              } else {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Invalid credentials'),
                      content: const Text(
                          'The provided username or password is incorrect.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
