import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/circulare_progress.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/auth/managers/auth_cubit.dart';
import 'package:food_ox/features/auth/presentation/components/text_for_field_for_passwrod.dart';
import 'package:food_ox/features/auth/presentation/components/text_form_field.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isError = false;
  bool isRead = false;
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Login',
          style: GoogleFonts.darkerGrotesque(
            height: 1.h,
            color: AppColors.black3Color,
            fontWeight: FontWeight.w800,
            fontSize: 22.sp,
          ),
        ),
        leading: Container(),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, 'breakfastScreen');
          }
          else if (state is LoginErrorState) {
            SnackBar snackBar =
                SnackBarComponent.snackBar(content: 'Login has a problem');
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);

          return Form(
            key: loginKey,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    height: 750.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to FoodOX!',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Fill in your mobile number and email',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'to get started!',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 38.h),

                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.darkerGrotesque(
                                height: 1.h,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black2Color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 11.h),
                        CustomTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            } else if (!onError(value)) {
                              return 'Please enter valid as example@example.com';
                            }
                            return null;
                          },
                          hintText: 'Ex: example@gmail.com',
                        ),
                        SizedBox(height: 31.h),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style: GoogleFonts.darkerGrotesque(
                                height: 1.h,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black2Color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 11.h),
                        CustomTextFormFieldForPassword(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          obscureText: isShown ? false : true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length <= 3) {
                              return 'Password is weak';
                            }
                            return null;
                          },
                          hintText: 'Enter your password',
                          icon: Icon(
                            isShown == true
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.black3Color,
                            size: 20.sp,
                          ),
                          onPressed: () {
                            setState(() {
                              isShown = !isShown;
                            });
                          },
                        ),
                        SizedBox(height: 42.h),
                        state is LoginLoadingState
                            ? AppCircular.circularProgress(
                                color: AppColors.standardColor,
                              )
                            : AppButton.normalButton(
                                title: 'Login',
                                fontSize: 15.5.sp,
                                onPress: () {
                                  if (loginKey.currentState!.validate()) {
                                    cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                        SizedBox(height: 26.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'nt have an account?',
                              style: GoogleFonts.darkerGrotesque(
                                height: 1.h,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black3Color,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 26.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         Navigator.pushNamed(context, 'signupScreen');
                        //       },
                        //       child: Text(
                        //         'Go to Register',
                        //         style: GoogleFonts.darkerGrotesque(
                        //           decoration: TextDecoration.underline,
                        //           decorationColor: AppColors.black2Color,
                        //           fontWeight: FontWeight.w800,
                        //           color: AppColors.black3Color,
                        //           fontSize: 15.sp,
                        //           height: 1.h,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        AppButton.normalButton(
                          title: 'Signup',
                          fontSize: 15.5.sp,
                          onPress: () {
                            Navigator.pushNamed(context, 'signupScreen');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

bool onError(String value) {
  return RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[.]+[com]").hasMatch(value);
}
