part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetProfileDataLoadingState extends HomeState {}

class GetProfileDataSuccessState extends HomeState {}

class GetProfileDataErrorState extends HomeState {}
