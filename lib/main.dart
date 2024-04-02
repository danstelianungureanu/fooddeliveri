import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveri/services/auth/auth_gate.dart';
import 'package:fooddeliveri/firebase_options.dart';
import 'package:fooddeliveri/models/restaurant.dart';
import 'package:fooddeliveri/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
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
      home: const AuthGate(
          // onTap: () {},
          ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
