import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/features/layout/home/managers/home_cubit.dart';
import 'package:food_ox/features/categries/data/get_user_menu_model.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/layout/recommended/manageres/recommended_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditRecommendedScreen extends StatefulWidget {
  const EditRecommendedScreen({Key? key}) : super(key: key);

  @override
  State<EditRecommendedScreen> createState() => _EditRecommendedScreenState();
}

class _EditRecommendedScreenState extends State<EditRecommendedScreen> {
  List<MealModel> choossenList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);

        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            title: Text(
              'Edit Recommended ',
              style: GoogleFonts.darkerGrotesque(
                color: AppColors.blackColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                height: 1.h,
              ),
            ),
            actions: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.transparentColor,
                child: SvgPicture.asset('assets/svg/chef.svg'),
              ),
            ],
            iconTheme: const IconThemeData(
              color: AppColors.standardColor, // Replace with your desired color
            ),
          ),
          body: BlocConsumer<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              var cubit = CategoriesCubit.get(context);
              var menuModel = cubit.getUserMenuModel;

              return state is DeleteOneItemFromMenuLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),

                            // BreakFast
                            Text(
                              'BreakFast : ',
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                height: 1.h,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            // BreakFast
                            SizedBox(
                                height: 220.h,
                                child: menuModel == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : menuModel.menu == null
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: menuModel
                                                .menu!.breakFast!.length,
                                            itemBuilder: (context, index) {
                                              var itemBreakFast = menuModel.menu!.breakFast![index];
                                              return Container(
                                                width: 173.w,
                                                height: 236.h,
                                                margin: EdgeInsets.all(10.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  color:
                                                      AppColors.standardColor2,
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 5.h),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                20.r),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.r),
                                                      ),
                                                      child: Image.network(
                                                        '${AppConstants.baseUrl}${itemBreakFast.img.toString()}',
                                                        height: 90.h,
                                                        width: 164.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            itemBreakFast.name!,
                                                            style: GoogleFonts
                                                                .darkerGrotesque(
                                                              height: 1.h,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${itemBreakFast.price} EGP',
                                                            style: GoogleFonts
                                                                .darkerGrotesque(
                                                              height: 1.h,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 15.h),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            itemBreakFast.type!,
                                                            style: GoogleFonts
                                                                .darkerGrotesque(
                                                              height: 1.h,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          choossenList.contains(
                                                                      itemBreakFast) ==
                                                                  true
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  size: 30.sp,
                                                                  color:
                                                                      AppColors
                                                                          .color,
                                                                )
                                                              : InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      choossenList
                                                                          .add(
                                                                              itemBreakFast);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 24.w,
                                                                    height:
                                                                        25.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .color,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        5.r,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                        size: 18
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                          Text(
                                                            '${itemBreakFast.category}',
                                                            style: GoogleFonts
                                                                .darkerGrotesque(
                                                              height: 1.h,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          )),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            Text(
                              'Lunch : ',
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                height: 1.h,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            // Lunch
                            SizedBox(
                                height: 220.h,
                                child: menuModel == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            menuModel.menu!.lunch!.length,
                                        itemBuilder: (context, index) {
                                          var itemBreakFast =
                                              menuModel.menu!.lunch![index];
                                          return Container(
                                            width: 173.w,
                                            height: 236.h,
                                            margin: EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: AppColors.standardColor2,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 5.h),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.r),
                                                    topLeft:
                                                        Radius.circular(20.r),
                                                  ),
                                                  child: Image.network(
                                                    '${AppConstants.baseUrl}${itemBreakFast.img.toString()}',
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        itemBreakFast.name!,
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${itemBreakFast.price} EGP',
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        itemBreakFast.type!,
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      choossenList.contains(
                                                                  itemBreakFast) ==
                                                              true
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: 30.sp,
                                                              color: AppColors
                                                                  .color,
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  choossenList.add(
                                                                      itemBreakFast);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 24.w,
                                                                height: 25.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .color,
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
                                                        '${itemBreakFast.category}',
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )),

                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            Text(
                              'Drink : ',
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                height: 1.h,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            //Drink
                            SizedBox(
                                height: 220.h,
                                child: menuModel == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            menuModel.menu!.drinks!.length,
                                        itemBuilder: (context, index) {
                                          var itemBreakFast =
                                              menuModel.menu!.drinks![index];
                                          return Container(
                                            width: 173.w,
                                            height: 236.h,
                                            margin: EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: AppColors.standardColor2,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 5.h),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.r),
                                                    topLeft:
                                                        Radius.circular(20.r),
                                                  ),
                                                  child: Image.network(
                                                    '${AppConstants.baseUrl}${itemBreakFast.img.toString()}',
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        itemBreakFast.name!,
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${itemBreakFast.price} EGP',
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        itemBreakFast.type!,
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      choossenList.contains(
                                                                  itemBreakFast) ==
                                                              true
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: 30.sp,
                                                              color: AppColors
                                                                  .color,
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  choossenList.add(
                                                                      itemBreakFast);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 24.w,
                                                                height: 25.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .color,
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
                                                        '${itemBreakFast.category}',
                                                        style: GoogleFonts
                                                            .darkerGrotesque(
                                                          height: 1.h,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )),

                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    );
            },
            listener: (context, state) {
              if (state is DeleteOneItemFromMenuSuccess) {
                var cubit = CategoriesCubit.get(context);
                cubit.getMenu();
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              BlocConsumer<RecommendedCubit, RecommendedState>(
            listener: (context, state) {
              var cubit = RecommendedCubit.get(context);
              if (state is EditDayFoodSuccess) {
                cubit.geyRecommendation();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              var cubit = RecommendedCubit.get(context);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton.normalButton(
                  title: 'Next',
                  fontSize: 15.5.sp,
                  onPress: () {
                    cubit.editRecommended(editList: choossenList);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
