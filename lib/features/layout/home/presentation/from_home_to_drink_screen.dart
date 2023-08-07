// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/categries/data/get_gategories_model.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/categries/presentation/lunch_screen.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:google_fonts/google_fonts.dart';

class FromHomeToDrinkScreen extends StatefulWidget {
  FromHomeToDrinkScreen({Key? key}) : super(key: key);

  @override
  State<FromHomeToDrinkScreen> createState() =>
      _FromHomeToDrinkScreenState();
}

class _FromHomeToDrinkScreenState extends State<FromHomeToDrinkScreen> {
  List<Food> choossenList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(

      builder: (context, state) {
        var cubit = BlocProvider.of<CategoriesCubit>(context);
        var drinkModel = cubit.getDrinkModel;
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            title: Text(
              'Lunch',
              style: GoogleFonts.darkerGrotesque(
                color: AppColors.blackColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                height: 1.h,
              ),
            ),
          ),
          body: state is GetCategoryLoadingState
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.standardColor,
            ),
          )
              : drinkModel == null
              ? const CircularProgressIndicator(
            color: AppColors.standardColor,
          )
              : Column(
            children: [
              SizedBox(height: 17.h),
              Text(
                'Choose Your favorite Lunch',
                style: GoogleFonts.darkerGrotesque(
                  height: 1.h,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 31.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: NotificationListener<
                    OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                    return false;
                  },
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: drinkModel.food!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.w,
                      mainAxisSpacing: 25.h,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 173.w,
                        height: 236.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.standardColor2,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 5.h),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.network(
                                '${AppConstants.baseUrl}${drinkModel.food![index].img.toString()}',
                                height: 90.h,
                                width: 164.w,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    drinkModel.food![index].name!,
                                    style:
                                    GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${drinkModel.food![index].price} EGP',
                                    style:
                                    GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    drinkModel.food![index].type!,
                                    style:
                                    GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  choossenList.contains(drinkModel
                                      .food![index]) ==
                                      true
                                      ? Icon(
                                    Icons.check_circle,
                                    size: 30.sp,
                                    color: AppColors.color,
                                  )
                                      : InkWell(
                                    onTap: () {
                                      setState(() {
                                        choossenList.add(
                                            drinkModel
                                                .food![index]);
                                      });
                                    },
                                    child: Container(
                                      width: 24.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.color,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                          5.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors
                                              .whiteColor,
                                          size: 18.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${drinkModel.food![index].category}',
                                    style:
                                    GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocListener<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
              var cubit = CategoriesCubit.get(context);
              if (state is AddFoodToMenuSuccessState) {
                cubit.getMenu();
                Navigator.pop(context);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppButton.normalButton(
                title: 'Next',
                fontSize: 15.5.sp,
                onPress: () {
                  cubit.addMenu(foods: choossenList);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
