import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/layout/recommended/data/get_day_food_model.dart';
import 'package:meta/meta.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedInitial());

  static RecommendedCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  GetDayFoodModel? getDayFoodModel;

  Future<void> geyRecommendation() async {
    emit(GetDayFoodLoading());
    dioHelper.getData(endPoint: 'user/day/food').then((value) {
      print(value.data);

      getDayFoodModel = GetDayFoodModel.fromJson(value.data);
      emit(GetDayFoodSuccess());
    }).catchError((e) {
      emit(GetDayFoodError());
    });
  }

  void editRecommended({required List editList}) {
    emit(EditDayFoodLoading());
    dioHelper.putData(
      endPoint: 'user/day/food',
      body: {
        "foods": editList,
      },
    ).then((value) {
      emit(EditDayFoodSuccess());
    }).catchError((e) {
      emit(EditDayFoodError());
    });
  }
}
