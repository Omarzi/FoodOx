import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/food_ox_app/food_ox_app.dart';
import 'package:food_ox/utiles/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await MyConfigCach.init();
  runApp(const FoodOxApp());
}
