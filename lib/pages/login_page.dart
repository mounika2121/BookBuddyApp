import 'package:bookbuddy/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Use key property in constructor

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;
  bool _showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 239, 242),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'BookBuddy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    onChanged: (value) {
                      setState(() {
                        _isUsernameValid = value.isNotEmpty;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        _isPasswordValid = value.isNotEmpty;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Show error message if username or password is empty
                        _showErrorMessage =
                            !(_isUsernameValid && _isPasswordValid);
                      });
                      if (_isUsernameValid && _isPasswordValid) {
                        // Navigate to home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              username: _usernameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Login'),
                  ),
                  if (_showErrorMessage)
                    const Text(
                      'Enter valid username and password',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
