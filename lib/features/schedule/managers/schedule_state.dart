part of 'schedule_cubit.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitialState extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {}

class ScheduleSuccessState extends ScheduleState {}

class ScheduleErrorState extends ScheduleState {}
