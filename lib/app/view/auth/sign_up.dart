import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/view/auth/sign_in.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/agreement_card.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/auth_field.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/primary_button.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/social_button.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/text_divider.dart';
import 'package:flutter_delivery_app/utils/constants/app_colors.dart';
import 'package:flutter_delivery_app/utils/constants/image_path.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.kPrimary,
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const Text('Create Account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 5),
                const Text('Lorem ipsum dolor sit amet, consectetur',
                    style: TextStyle(fontSize: 14, color: AppColors.kGrey60)),
                const SizedBox(height: 30),
                // FullName.
                AuthField(
                  title: 'Full Name',
                  hintText: 'Enter your name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    } else if (!RegExp(r'^[a-zA-Z ]+ $').hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Email Field.
                AuthField(
                  title: 'E-mail',
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!value.isEmpty) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                // Password Field.
                AuthField(
                  title: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password should be at least 8 characters long';
                    }
                    return null;
                  },
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kGrey70),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()));
                              },
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kPrimary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Create An Account',
                ),
                const SizedBox(height: 30),
                const TextWithDivider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      onTap: () {},
                      icon: ImagesPath.kGoogle,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: ImagesPath.kApple,
                    ),
                    CustomSocialButton(
                      onTap: () {},
                      icon: ImagesPath.kFacebook,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AgreeTermsTextCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}