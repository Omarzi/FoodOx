part of 'categories_cubit.dart';

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
/// GEt Menu
class GetMenuSuccess extends CategoriesState {}
class GetMenuError extends CategoriesState {}
class GetMenuLoading extends CategoriesState {}

class GetBreakFastFunSusses extends CategoriesState {}
class GetBreakFastFunError extends CategoriesState {}
class GetBreakFastFunLoading extends CategoriesState {}

class GetLunchFunLoading extends CategoriesState {}
class GetLunchFunError extends CategoriesState {}
class GetLunchFunSuccess extends CategoriesState {}

class GetDrinkFunSuccess extends CategoriesState {}
class GetDrinkFunError extends CategoriesState {}
class GetDrinkFunLoading extends CategoriesState {}

class DeleteOneItemFromMenuSuccess extends CategoriesState {}
class DeleteOneItemFromMenuError extends CategoriesState {}
class DeleteOneItemFromMenuLoading extends CategoriesState {}



