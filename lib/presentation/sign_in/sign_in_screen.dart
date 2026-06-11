import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';

import '../../core/presentation/components/input_field.dart';
import '../../ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onTapSingIn;
  final VoidCallback onTapSignUp;
  const SignInScreen({super.key, required this.onTapSignUp, required this.onTapSingIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Hello,',
                  style: TextStyles.headerTextBold,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyles.largeTextRegular,
                ),
                const SizedBox(height: 57),
                InputField(
                  label: 'Email',
                  placeholder: 'Enter email',
                ),
                const SizedBox(height: 30),
                InputField(
                  label: 'Enter Password',
                  placeholder: 'Enter password',
                ),
                const SizedBox(height: 20,),
                Text(
                  'Forgot Password?',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.secondary100,
                  ),
                ),
                const SizedBox(height: 25,),
                BigButton(
                'Sign In',
                    onPressed: onTapSingIn ,
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 1,
                      color: AppColors.gray4,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'Or Sign in With',
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.gray4,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      width: 50,
                      height: 1,
                      color: AppColors.gray4,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/google_button.png',
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/image/facebook_button.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyles.smallerTextBold,
                    ),
                    GestureDetector(
                      onTap: onTapSignUp,
                      child: Text(
                        'Sign up',
                        style: TextStyles.smallerTextBold.copyWith(
                          color: AppColors.secondary100,
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          )
      ),
    );
  }
}
