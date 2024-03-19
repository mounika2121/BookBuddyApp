import 'package:flutter/material.dart';
import 'package:bookbuddy/pages/login_page.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  Color _themeColor = Colors.blue; // Initial theme color

  void _changeThemeColor(Color color) {
    setState(() {
      _themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _themeColor, // Set the background color dynamically
        actions: [
          IconButton(
            icon: const Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
            onPressed: () {
              _showThemeColorDialog(context);
            },
          ),
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Hello ${widget.username} Welcome',
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Image(
            image: NetworkImage(
                'https://res.cloudinary.com/djbs4yqbz/image/upload/v1709012776/quotesbooks_r9zgmq.jpg'),
            width: double.infinity,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  void _showThemeColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _themeColor,
              onColorChanged: (Color color) {
                _changeThemeColor(color);
              },
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              showLabel: true,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2.0),
                topRight: Radius.circular(2.0),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
