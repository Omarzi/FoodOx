import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/features/categries/data/get_user_menu_model.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemInHomeScreen extends StatelessWidget {
  const CategoryItemInHomeScreen(
      {Key? key, required this.listMeal, required this.onTap, this.delete})
      : super(key: key);
  final List<MealModel> listMeal;
  final void Function(int index) onTap;
  final Icon? delete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: listMeal.length,
        itemBuilder: (context, index) {
          return Container(
            width: 173.w,
            height: 236.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              // only(
              //   // topLeft: Radius.circular(20.r),
              //   topRight: Radius.circular(20.r),
              // ),
              color: AppColors.standardColor2,
            ),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),

                  child: Image.network(
                    fit: BoxFit.cover,
                    '${AppConstants.baseUrl}${listMeal[index].img.toString()}',
                    height: 90.h,
                    width: 164.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listMeal[index].name!,
                        style: GoogleFonts.darkerGrotesque(
                          height: 1.h,
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${listMeal[index].price} EGP',
                        style: GoogleFonts.darkerGrotesque(
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
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listMeal[index].type!,
                        style: GoogleFonts.darkerGrotesque(
                          height: 1.h,
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      delete ??     InkWell(
                        onTap: () {
                          onTap(index);
                        },
                        child: Container(
                          width: 24.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: AppColors.color,
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                               Icons.delete,
                              color: AppColors.whiteColor,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${listMeal[index].category}',
                        style: GoogleFonts.darkerGrotesque(
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
    );
  }
}
