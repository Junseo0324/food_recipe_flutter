import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';

import '../../core/presentation/components/input_field.dart';
import '../../ui/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onTapSignIn;
  const SignUpScreen({super.key, required this.onTapSignIn});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Create an account',
                    style: TextStyles.largeTextBold,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Let’s help you set up your account, it won’t take long.',
                      style: TextStyles.smallerTextRegular,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Name',
                    placeholder: 'Enter Name',
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Email',
                    placeholder: 'Enter Email',
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Password',
                    placeholder: 'Enter Password',
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Confirm Password',
                    placeholder: 'Retype Password',
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: BorderSide(
                            color: AppColors.secondary100,
                          ),
                          activeColor: AppColors.secondary100,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          }
                      ),
                      Text(
                        'Accept terms & Condition',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.secondary100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26,),
                  BigButton(
                    'Sign Up',
                    onPressed: () {} ,
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyles.smallerTextBold,
                      ),
                      GestureDetector(
                        onTap: widget.onTapSignIn,
                        child: Text(
                          'Sign In',
                          style: TextStyles.smallerTextBold.copyWith(
                            color: AppColors.secondary100,
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
