part of 'recommended_cubit.dart';

@immutable
abstract class RecommendedState {}

class RecommendedInitial extends RecommendedState {}

class GetDayFoodSuccess extends RecommendedState {}
class GetDayFoodLoading extends RecommendedState {}
class GetDayFoodError extends RecommendedState {}

class EditDayFoodError extends RecommendedState {}
class EditDayFoodSuccess extends RecommendedState {}
class EditDayFoodLoading extends RecommendedState {}
