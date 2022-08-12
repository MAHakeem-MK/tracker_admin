import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker_admin/views/login_page.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return MaterialApp(
          title: 'Tracker Admin',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: (snapshot.data?.getBool('authenticated') ?? false) ? '/home' : '/login',
          routes: {
            '/login' : (context) => const LoginPage(),
            '/home' : (context) => const HomePage(), 
          },
        );
      }
    );
  }
}

