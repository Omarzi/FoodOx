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

class BreakFastScreen extends StatefulWidget {
  const BreakFastScreen({Key? key, required this.whereFrom}) : super(key: key);
  final String whereFrom;

  @override
  State<BreakFastScreen> createState() => _BreakFastScreenState();
}

class _BreakFastScreenState extends State<BreakFastScreen> {
  List<Food> choosenList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getBreakFast(type: 'breakfast'),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state is AddFoodToMenuSuccessState) {
            SnackBar snackBar =
                SnackBarComponent.snackBar(content: 'Addition success');
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is AddFoodToMenuErrorState) {
            SnackBar snackBar =
                SnackBarComponent.snackBar(content: 'Addition has a problem');
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<CategoriesCubit>(context);

          return Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.transparentColor,
              elevation: 0,
              title: Text(
                'BreakFast',
                style: GoogleFonts.darkerGrotesque(
                  color: AppColors.blackColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.h,
                ),
              ),
            ),
            body: state is GetCategoryLoadingState?
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.standardColor,
                    ),
                  )
                : cubit.getCategoryModel == null
                    ? const CircularProgressIndicator(
                        color: AppColors.standardColor,
                      )
                    : Column(
                        children: [
                          SizedBox(height: 17.h),
                          Text(
                            'Choose Your favorite breakfast',
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
                                itemCount: cubit.getCategoryModel!.food!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.w,
                                  mainAxisSpacing: 25.h,
                                ),
                                itemBuilder: (context, index) {
                                  var item =
                                      cubit.getCategoryModel!.food![index];
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
                                            '${AppConstants.baseUrl}${cubit.getCategoryModel!.food![index].img.toString()}',
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
                                                cubit.getCategoryModel!
                                                    .food![index].name!,
                                                style:
                                                    GoogleFonts.darkerGrotesque(
                                                  height: 1.h,
                                                  color: AppColors.whiteColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '${cubit.getCategoryModel!.food![index].price} EGP',
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
                                                cubit.getCategoryModel!
                                                    .food![index].type!,
                                                style:
                                                    GoogleFonts.darkerGrotesque(
                                                  height: 1.h,
                                                  color: AppColors.whiteColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              choosenList.contains(item) == true
                                                  ? const Icon(
                                                      Icons.check_circle)
                                                  : InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          choosenList.add(item);
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 24.w,
                                                        height: 25.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.color,
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
                                                '${cubit.getCategoryModel!.food![index].category}',
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
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppButton.normalButton(
                title: 'Next',
                fontSize: 15.5.sp,
                onPress: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          LunchScreen(choosenList: choosenList),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: Tween<double>(begin: 0, end: 1)
                              .animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
