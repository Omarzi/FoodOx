import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_exeptions.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/categries/data/get_gategories_model.dart';
import 'package:food_ox/features/categries/data/get_user_menu_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitialState());

 static CategoriesCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  GetCategoryModel? getCategoryModel;

  Future<void> getBreakFast({required String type}) async {
    emit(GetCategoryLoadingState());
    await dioHelper.getData(endPoint: 'user/foods?type=$type').then((response) {
      print(response.data);
      getCategoryModel = GetCategoryModel.fromJson(response.data);
      emit(GetCategorySuccessState());
    }).catchError((error) {
      print('Error in get category is $error');
      emit(GetCategoryErrorState());
    });
  }

  GetCategoryModel? getBreakFastModel;

  Future<void> getBreakFastFun() async {
    emit(GetBreakFastFunLoading());
    await dioHelper
        .getData(endPoint: 'user/foods?type=breakfast')
        .then((response) {
      print(response.data);
      getBreakFastModel = GetCategoryModel.fromJson(response.data);
      emit(GetBreakFastFunSusses());
    }).catchError((error) {
      print('Error in get getBreakFastModel is $error');
      emit(GetBreakFastFunError());
    });
  }

  GetCategoryModel? getLunchModel;

  Future<void> getLunchFun() async {
    emit(GetLunchFunLoading());
    await dioHelper.getData(endPoint: 'user/foods?type=lunch').then((response) {
      print(response.data);
      getLunchModel = GetCategoryModel.fromJson(response.data);
      emit(GetLunchFunSuccess());
    }).catchError((error) {
      print('Error in get getLunchModel is $error');
      emit(GetLunchFunError());
    });
  }

  GetCategoryModel? getDrinkModel;

  Future<void> getDrinkFun() async {
    emit(GetDrinkFunLoading());
    await dioHelper.getData(endPoint: 'user/foods?type=drink').then((response) {
      print(response.data);
      getDrinkModel = GetCategoryModel.fromJson(response.data);
      emit(GetDrinkFunSuccess());
    }).catchError((error) {
      print('Error in get getDrinkModel is $error');
      emit(GetDrinkFunError());
    });
  }

  Future<void> addMenu({required List foods}) async {
    emit(AddFoodToMenuLoadingState());
    await dioHelper.postData(endPoint: 'user/menu', body: {
      'foods': foods,
    }).then((response) {
      print(response.data);
      emit(AddFoodToMenuSuccessState());
    }).catchError((error) {
      print('Error in Add Food to menu is $error');
      emit(AddFoodToMenuErrorState());
    });
  }

  Future<void> deleteOneItemFromMenu({required String itemId}) async {
    emit(DeleteOneItemFromMenuLoading());
    dioHelper
        .deleteData(
      endPoint: 'user/menu/$itemId',
    )
        .then((value) {
      emit(DeleteOneItemFromMenuSuccess());
    }).catchError((e) {
      print(e);
      emit(DeleteOneItemFromMenuError());
    });
  }

  GetUserMenuModel? getUserMenuModel;

  void getMenu() async {
    emit(GetMenuLoading());
    dioHelper.getData(endPoint: 'user/menu').then((value) {
      print(value.data);
      getUserMenuModel = GetUserMenuModel.fromJson(value.data);
      emit(GetMenuSuccess());
    }).catchError((DioExceptions e) {
      log("the error in menu is ${e.message } ");
      emit(GetMenuError());
    });
  }
}
