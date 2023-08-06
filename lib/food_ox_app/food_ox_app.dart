import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/auth/managers/auth_cubit.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';

class FoodOxApp extends StatelessWidget {
  const FoodOxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => ScheduleCubit()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            // initialRoute: 'loginScreen',
            initialRoute: 'splashScreen',
          ),
        );
      },
    );
  }
}
