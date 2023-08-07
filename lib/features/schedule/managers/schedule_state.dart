part of 'schedule_cubit.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitialState extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {}

class ScheduleSuccessState extends ScheduleState {}

class ScheduleErrorState extends ScheduleState {}
//Get Schedule

class GetScheduleSuccess extends ScheduleState{}
class GetScheduleLoading extends ScheduleState{}
class GetScheduleError extends ScheduleState{}

class EditScheduleError extends ScheduleState{}
class EditScheduleLoading extends ScheduleState{}
class EditScheduleSuccess extends ScheduleState{}







