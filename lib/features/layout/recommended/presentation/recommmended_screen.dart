import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/categries/presentation/items/category_item_in_home.dart';
import 'package:food_ox/features/layout/recommended/manageres/recommended_cubit.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        title: Text(
          'Recommended',
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
          color: AppColors.standardColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 40.h),
          child: Column(
            children: [
              Text(
                'We recommend for you',
                overflow: TextOverflow.clip,
                style: GoogleFonts.darkerGrotesque(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.h,
                ),
              ),

              Container(
                width: double.infinity,
                height: 500.h,
                margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 40.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.w,
                    color: AppColors.standardColor,
                  ),
                ),
                child: BlocBuilder<RecommendedCubit, RecommendedState>(
                  builder: (context, state) {
                    var cubit = RecommendedCubit.get(context);
                    var model = cubit.getDayFoodModel;
                    return model == null
                        ? const Center(child: CircularProgressIndicator())

                        // : model.order == null
                        //     ? const Center(child: CircularProgressIndicator())
                        //     : model.order!.foods == null
                        //         ? const Center(
                        //             child: CircularProgressIndicator())
                        //         :

                        : model.order == {}
                            ? Center(child: Text("No Recommended For Day"))
                            : model.order!.foods == null
                                ? const Center(
                                    child: Text("No Recommended For Day"))
                                : ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10.w),
                                    itemCount: model.order!.foods!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 173.w,
                                        height: 200.h,
                                        margin: EdgeInsets.all(12.w),
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
                                                '${AppConstants.baseUrl}${model.order!.foods![index].img.toString()}',
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
                                                    model.order!.foods![index]
                                                        .name!,
                                                    style: GoogleFonts
                                                        .darkerGrotesque(
                                                      height: 1.h,
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${model.order!.foods![index].price} EGP',
                                                    style: GoogleFonts
                                                        .darkerGrotesque(
                                                      height: 1.h,
                                                      color:
                                                          AppColors.whiteColor,
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
                                                    model.order!.foods![index]
                                                        .type!,
                                                    style: GoogleFonts
                                                        .darkerGrotesque(
                                                      height: 1.h,
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  // InkWell(
                                                  //   onTap: () {
                                                  //     // onTap(index);
                                                  //   },
                                                  //   child: Container(
                                                  //     width: 24.w,
                                                  //     height: 25.h,
                                                  //     decoration: BoxDecoration(
                                                  //       color: AppColors.color,
                                                  //       borderRadius: BorderRadius.circular(
                                                  //         5.r,
                                                  //       ),
                                                  //     ),
                                                  //     child: Center(
                                                  //       child: Icon(
                                                  //         Icons.delete,
                                                  //         color: AppColors.whiteColor,
                                                  //         size: 18.sp,
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Text(
                                                    '${model.order!.foods![index].category}',
                                                    style: GoogleFonts
                                                        .darkerGrotesque(
                                                      height: 1.h,
                                                      color:
                                                          AppColors.whiteColor,
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
                                  );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<CategoriesCubit>().getMenu();
                  Navigator.pushNamed(context, RoutePath.editRecommendedScreen);
                },
                child: Text(
                  'Choose your own food!',
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.darkerGrotesque(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.h,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
