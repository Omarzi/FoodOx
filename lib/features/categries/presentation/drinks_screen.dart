import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/features/categries/data/get_gategories_model.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/schedule/presentation/schedule_screen.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:food_ox/utiles/app_constatnts.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinksScreen extends StatefulWidget {
  List<Food> choosenList;

  DrinksScreen({Key? key, required this.choosenList}) : super(key: key);

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getBreakFast(type: 'drink'),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<CategoriesCubit>(context);

          if(state is AddFoodToMenuSuccessState){
            cubit.getMenu();
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (context, animation, secondaryAnimation) => ScheduleScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: child,
                  );
                },
              ),
            );
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
                'Drinks',
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
                            'Choose Your favorite drinks',
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
                                            horizontal: 5.w,
                                          ),
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
                                              widget.choosenList.contains(item) == true
                                                  ? const Icon(
                                                  Icons.check_circle)
                                                  : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    widget.choosenList.add(item);
                                                  });
                                                },
                                                child: Container(
                                                  width: 24.w,
                                                  height: 25.h,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.r,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.whiteColor,
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
                  cubit.addMenu(foods:widget. choosenList);
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 200),
                  //     pageBuilder: (context, animation, secondaryAnimation) => LunchScreen(
                  //       getCategoryModel: cubit.getCategoryModel!,
                  //     ),
                  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  //       return FadeTransition(
                  //         opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                  //         child: child,
                  //       );
                  //     },
                  //   ),
                  // );


                },
              ),
            ),
          );
        },
      ),
    );
  }
}
