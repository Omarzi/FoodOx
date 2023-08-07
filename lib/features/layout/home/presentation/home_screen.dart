import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/categries/presentation/items/category_item_in_home.dart';
import 'package:food_ox/features/layout/home/managers/home_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);

        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    radius: 32.r,
                    backgroundColor: AppColors.transparentColor,
                    child: SvgPicture.asset('assets/svg/chef.svg'),
                  ),
                  accountEmail: Text(
                    "${cubit.profileModel.user == null ? 'Loading' : cubit.profileModel.user!.email}",
                    style: GoogleFonts.darkerGrotesque(
                      fontWeight: FontWeight.w600,
                      height: 1.h,
                      fontSize: 16.sp,
                    ),
                  ),
                  accountName: Text(
                    "${cubit.profileModel.user == null ? 'Loading' : cubit.profileModel.user!.username}",
                    style: GoogleFonts.darkerGrotesque(
                      fontWeight: FontWeight.w600,
                      height: 2.h,
                      fontSize: 24.sp,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.standardColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                ),
                // ListTile(
                //   leading: const Icon(Icons.support_agent),
                //   title: Text(
                //     'Support',
                //     style: GoogleFonts.darkerGrotesque(
                //       fontWeight: FontWeight.w600,
                //       height: 1.h,
                //       fontSize: 24.sp,
                //     ),
                //   ),
                //   onTap: () {
                //     // Navigator.pushReplacement(
                //     //   context,
                //     //   MaterialPageRoute<void>(
                //     //     builder: (BuildContext context) => const MyHomePage(
                //     //       title: 'Houses',
                //     //     ),
                //     //   ),
                //     // );
                //   },
                //   trailing: Icon(
                //     Icons.arrow_forward_ios,
                //     size: 18.sp,
                //   ),
                // ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_sharp,
                    color: AppColors.errorColor,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.darkerGrotesque(
                      fontWeight: FontWeight.w600,
                      color: AppColors.errorColor,
                      height: 1.h,
                      fontSize: 24.sp,
                    ),
                  ),
                  onTap: () {
                    MyConfigCach.removeFromShared(key: MyConfigCacheKeys.roles);
                    MyConfigCach.removeFromShared(key: MyConfigCacheKeys.token);
                    Navigator.pushReplacementNamed(context, 'loginScreen');
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18.sp,
                    color: AppColors.errorColor,
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            title: Text(
              'Home',
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
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                var cubit = HomeCubit.get(context);
                                return Text(
                                  "Hi ${cubit.profileModel.user == null ? 'Loading' : cubit.profileModel.user!.username}, Welcome back.",
                                  style: GoogleFonts.darkerGrotesque(
                                    fontWeight: FontWeight.w600,
                                    height: 2.h,
                                    fontSize: 24.sp,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            // BreakFast
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BreakFast : ',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    height: 1.h,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //// Make Add Menu.
                                    BlocProvider.of<CategoriesCubit>(context)
                                        .getBreakFastFun();
                                    Navigator.pushNamed(context,
                                        RoutePath.fromHomeToBreakFastScreen);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: AppColors.standardColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            // BreakFast
                            SizedBox(
                              height: 220.h,
                              child: menuModel == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : state is GetBreakFastFunLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : CategoryItemInHomeScreen(
                                          listMeal:
                                          menuModel.menu == null ? [] :       menuModel.menu!.breakFast ?? [],
                                          onTap: (index) {
                                            if (menuModel
                                                    .menu!.breakFast!.length !=
                                                1) {
                                              cubit.deleteOneItemFromMenu(
                                                itemId: menuModel.menu!
                                                    .breakFast![index].sId!,
                                              );
                                            }
                                          },
                                        ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lunch : ',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    height: 1.h,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CategoriesCubit>(context)
                                        .getLunchFun();
                                    Navigator.pushNamed(context,
                                        RoutePath.fromHomeToLunchScreen);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: AppColors.standardColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 220.h,
                              child: menuModel == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CategoryItemInHomeScreen(
                                      listMeal: menuModel.menu == null ? [] : menuModel.menu!.lunch ?? [],
                                      onTap: (index) {
                                        if (menuModel.menu!.lunch!.length !=
                                            1) {
                                          cubit.deleteOneItemFromMenu(
                                            itemId: menuModel
                                                .menu!.lunch![index].sId!,
                                          );
                                        }
                                      },
                                    ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Drink : ',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    height: 1.h,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CategoriesCubit>(context)
                                        .getDrinkFun();
                                    Navigator.pushNamed(context,
                                        RoutePath.fromHomeToDrinkScreen);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: AppColors.standardColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 220.h,
                              child: menuModel == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CategoryItemInHomeScreen(
                                      listMeal: menuModel.menu == null ? [] : menuModel.menu!.drinks ?? [],
                                      onTap: (index) {
                                        if (menuModel.menu!.drinks!.length !=
                                            1) {
                                          cubit.deleteOneItemFromMenu(
                                            itemId: menuModel
                                                .menu!.drinks![index].sId!,
                                          );
                                        }
                                      },
                                    ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.grey[500], thickness: 1),
                            SizedBox(height: 10.h),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<ScheduleCubit>(context).getSchedule();
                                Navigator.pushNamed(context, RoutePath.editScheduleScreen);
                              },
                              child: Text("Edit Schedule"),
                            ),
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
        );
      },
    );
  }
}
