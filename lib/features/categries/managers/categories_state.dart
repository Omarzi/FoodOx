part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

/// Break Fast
class GetCategoryLoadingState extends CategoriesState {}

class GetCategorySuccessState extends CategoriesState {}

class GetCategoryErrorState extends CategoriesState {}

/// Add Food To Menu
class AddFoodToMenuLoadingState extends CategoriesState {}

class AddFoodToMenuSuccessState extends CategoriesState {}

class AddFoodToMenuErrorState extends CategoriesState {}
