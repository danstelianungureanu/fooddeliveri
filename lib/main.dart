import 'package:flutter/material.dart';
import 'package:fooddeliveri/auth/login_or_register.dart';
import 'package:fooddeliveri/models/restaurant.dart';
import 'package:fooddeliveri/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => ThemeProvider(),
    //   child: const MyApp(),
    // ),
    MultiProvider(
      providers: [
        // theme provide
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(
          // onTap: () {},
          ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
