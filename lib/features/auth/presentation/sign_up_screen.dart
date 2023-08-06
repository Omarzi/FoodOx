import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/circulare_progress.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/auth/managers/auth_cubit.dart';
import 'package:food_ox/features/auth/presentation/components/text_for_field_for_passwrod.dart';
import 'package:food_ox/features/auth/presentation/components/text_form_field.dart';
import 'package:food_ox/features/auth/presentation/components/text_form_field_for_mobile.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  bool isShown = false;
  bool isShown2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Register',
          style: GoogleFonts.darkerGrotesque(
            height: 0.1.h,
            color: AppColors.black3Color,
            fontWeight: FontWeight.w800,
            fontSize: 18.sp,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: SvgPicture.asset('${AppConstants.baseSvgUrl}arrowBack.svg',
                color: AppColors.darkGrey),
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pushReplacementNamed(context, 'loginScreen');
          } else if (state is SignUpErrorState) {
            SnackBar snackBar =
            SnackBarComponent.snackBar(content: 'Signup has a problem');
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);

          return Form(
            key: signupKey,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    height: 850.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Our Stores!',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Join us today',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'now',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 38.h),
                        Row(
                          children: [
                            Text(
                              'User Name',
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
                          controller: userNameController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your user name';
                            } else if (value.length < 2) {
                              return 'Please enter real user name';
                            }
                            return null;
                          },
                          hintText: 'Enter your user name',
                        ),
                        SizedBox(height: 31.h),
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
                              'Mobile Number',
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
                        CustomTextFormFieldForMobile(
                          controller: phoneController,
                          type: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a phone number';
                            } else if (value.length > 10 || value.length < 10) {
                              return 'Please enter a valid number between 9 : 10';
                            } else if (value.length < 9) {
                              return 'Please enter a valid number between 9 : 10';
                            }
                            return null;
                          },
                          prefix: '+20',
                          hintText: 'Enter your phone',
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
                            } else if (value.length <= 5) {
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
                        SizedBox(height: 31.h),
                        Row(
                          children: [
                            Text(
                              'Confirm password',
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
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          obscureText: isShown2 ? false : true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a confirm password';
                            } else if (value.length <= 5) {
                              return 'Password is weak';
                            }
                            return null;
                          },
                          hintText: 'Enter your confirm password',
                          icon: Icon(
                            isShown2 == true
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.black3Color,
                            size: 20.sp,
                          ),
                          onPressed: () {
                            setState(() {
                              isShown2 = !isShown2;
                            });
                          },
                        ),
                        SizedBox(height: 28.h),
                        state is SignUpLoadingState
                            ? AppCircular.circularProgress(
                            color: AppColors.standardColor)
                            : AppButton.normalButton(
                          title: 'Register',
                          fontSize: 15.5.sp,
                          onPress: () {
                            cubit.signUp(
                              username: userNameController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            );
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
  return RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]").hasMatch(value);
}
