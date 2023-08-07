import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/managers/auth_cubit.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/layout/home/managers/home_cubit.dart';
import 'package:food_ox/features/layout/recommended/manageres/recommended_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/food_ox_app/food_ox_app.dart';
import 'package:food_ox/utiles/bloc_observer.dart';

// commit with me
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await MyConfigCach.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AuthCubit()),
    BlocProvider(create: (context) => RecommendedCubit()..geyRecommendation()),
    BlocProvider(create: (context) => HomeCubit()..getProfileData()),
    BlocProvider(
      create: (context) => CategoriesCubit()
        ..getMenu()
        ..getBreakFastFun()
        ..getLunchFun()
        ..getDrinkFun(),
    ),
    BlocProvider(create: (context) => ScheduleCubit()..getSchedule()),
  ], child: const FoodOxApp()));
}
