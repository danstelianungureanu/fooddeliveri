// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:fooddeliveri/components/my_button.dart';
import 'package:fooddeliveri/components/my_textfield.dart';
import 'package:fooddeliveri/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login method
  void login() async {
    // get instance of auth service
    final _authService = AuthService();

    // try sign in
    try {
      await _authService.signWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }
    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }

// forgot password

    void forgotPw() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text(
            'User tapped forgot password.',
          ),
        ),
      );
    }

    // navigate to home page
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox(
            height: 25,
          ),

          //message, app slogan
          Text(
            'Food Delivery App',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //email textfield
          MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          //password textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          //sign in button
          MyButton(
            text: 'Log In',
            onTap: login,
          ),
          // not a member? register now
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  'Register now',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
