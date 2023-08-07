import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/auth/managers/auth_cubit.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';

class FoodOxApp extends StatefulWidget {
  const FoodOxApp({Key? key}) : super(key: key);

  @override
  State<FoodOxApp> createState() => _FoodOxAppState();
}

class _FoodOxAppState extends State<FoodOxApp> {
  @override
  void initState() {
    super.initState();
    context.read<ScheduleCubit>().getSchedule();
    context.read<CategoriesCubit>().getMenu();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return  const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            // initialRoute: 'loginScreen',
            initialRoute: 'splashScreen',

        );
      },
    );
  }
}
