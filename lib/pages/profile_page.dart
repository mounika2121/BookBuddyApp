import 'package:flutter/material.dart';
import 'package:bookbuddy/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigate to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: const Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://res.cloudinary.com/djbs4yqbz/image/upload/v1709012776/quotesbooks_r9zgmq.jpg'),
              width: double.infinity,
              fit: BoxFit.cover,
            )
          ],
        ));
  }
}
