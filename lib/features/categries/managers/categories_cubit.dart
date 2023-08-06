import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/categries/data/get_gategories_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitialState());

  CategoriesCubit get(context) => BlocProvider.of(context);

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
}
