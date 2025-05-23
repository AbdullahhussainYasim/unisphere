import 'package:flutter/material.dart';
import 'package:unisphere/core/constants/constants.dart';
import 'package:unisphere/theme/pallete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unisphere/features/auth/controller/auth_controller.dart';


class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});



  void signInWithGoogle(BuildContext context,WidgetRef ref) {
      ref.read(authControllerProvider.notifier).signInWithGoogle(context);

  }



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context,ref),
        icon: Image.asset(Constants.googlepath,width: 35,),
        label: const Text("Continue with google",
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greyColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}