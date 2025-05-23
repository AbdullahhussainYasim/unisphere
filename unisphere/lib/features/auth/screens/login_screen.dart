import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unisphere/core/common/loader.dart';
import 'package:unisphere/core/common/sign_button.dart';
import 'package:unisphere/core/constants/constants.dart';
import 'package:unisphere/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(Constants.logopath, height: 40),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ),
      body:
          isLoading
              ? const Loader()
              : Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Dive into anything",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Constants.loginEmotepath, height: 400),
                  ),
                  const SizedBox(height: 20),
                  const SignInButton(),
                ],
              ),
    );
  }
}
