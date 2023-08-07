import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {


  @override
  Widget build(BuildContext context) {
    return

      BlocListener<CategoriesCubit,CategoriesState>(listener: (context, state) {
        var scheduleCubit = BlocProvider.of<ScheduleCubit>(context);
        var categoryCubit = BlocProvider.of<CategoriesCubit>(context);
        if (scheduleCubit.getScheduleModel != null &&
            categoryCubit.getUserMenuModel != null) {
          if (scheduleCubit.getScheduleModel!.exists == true &&
              categoryCubit.getUserMenuModel!.exists == true) {
            log("1111111111111");

            Navigator.pushReplacementNamed(context, RoutePath.layoutScreen);
          } else if (scheduleCubit.getScheduleModel!.exists == true &&
              categoryCubit.getUserMenuModel!.exists == false) {
            log("222222222222");

            Navigator.pushReplacementNamed(context, RoutePath.breakFastScreen,arguments: '');
          } else if (scheduleCubit.getScheduleModel!.exists == false &&
              categoryCubit.getUserMenuModel!.exists == true) {
            log("333333333333");

            Navigator.pushReplacementNamed(context, RoutePath.scheduleScreen);
          } else {
            log("4444444444444");

            Navigator.pushReplacementNamed(context, RoutePath.breakFastScreen,arguments: '');
          }
        }
      },
      child:Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      ) ,
      );

  }
}
