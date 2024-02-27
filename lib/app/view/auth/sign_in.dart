import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app/app/controller/signin/bloc/signin_bloc.dart';
import 'package:flutter_delivery_app/app/view/auth/sign_up.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/agreement_card.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/auth_field.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/custom_text_button.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/primary_button.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/remember_me_text.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/social_button.dart';
import 'package:flutter_delivery_app/app/view/auth/widgets/text_divider.dart';
import 'package:flutter_delivery_app/app/view/home/home_screen.dart';
import 'package:flutter_delivery_app/utils/colors.dart';
import 'package:flutter_delivery_app/utils/constants/image_path.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemember = false;
  SigninBloc signinBloc = SigninBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
          backgroundColor: AppColor.kWhite,
          elevation: 0,
          leading: const BackButton(
            color: AppColor.kPrimary,
          )),
      body: BlocConsumer<SigninBloc, SigninState>(
        bloc: signinBloc,
        listener: (context, state) {
          if (state is SignInSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            
          } else if (state is SignInErrorState) {
            showErrorSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if(state is SignInLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    const Text('Let’s Sign you in',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: 5),

                    const SizedBox(height: 30),
                    // Email Field.
                    AuthField(
                      title: 'Email Address',
                      hintText: 'Enter your email address',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
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
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        RememberMeCard(
                          onChanged: (value) {
                            setState(() {
                              isRemember = value;
                            });
                          },
                        ),
                        const Spacer(),
                        CustomTextButton(
                          onPressed: () {},
                          text: 'Forget Password',
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          signinBloc.add(SignInButtonPressedEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context));
                        }
                      },
                      text: 'Sign In',
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.kGrey70),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColor.kPrimary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
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
          );
        },
      ),
    );
  }
}
