// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/categries/data/get_schedule_model.dart';
import 'package:meta/meta.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitialState());

 static ScheduleCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  Future<void> makeSchedule(
      {required String period,
      required String work_from,
      required String work_to,
      required String break_from,
      required String break_to,
      required List<int> weekList}) async {
    emit(ScheduleLoadingState());
    await dioHelper.postData(endPoint: 'user/schedule', body: {
      "period": period,
      "work_from": work_from,
      "work_to": work_to,
      "break_from": break_from,
      "break_to": break_to,
      "days": weekList
    }).then((response) {
      print(response.data);
      emit(ScheduleSuccessState());
    }).catchError((error) {
      print('Error in make schedule is $error');
      emit(ScheduleErrorState());
    });
  }

  GetScheduleModel? getScheduleModel;

  void getSchedule() async {
    emit(GetScheduleLoading());
    dioHelper.getData(endPoint: 'user/schedule').then((value) {
      getScheduleModel = GetScheduleModel.fromJson(value.data);
      print(value.data);
      emit(GetScheduleSuccess());
    }).catchError((e) {
      print(e);
      emit(GetScheduleError());
    });
  }

  void editSchedule({
    required  String breakFrom,
    required  String breakTo,
    required  String workFrom,
    required  String workTo,
    required  String period,
    required  List<int> days,
  }) {
    emit(EditScheduleLoading());
    dioHelper.putData(endPoint: 'user/schedule', body: {
      'break_from': breakFrom,
      "break_to": breakTo,
      "work_from": workFrom,
      "work_to": workTo,
      "period": period,
      "days": days
    }).then((value) {
      emit(EditScheduleSuccess());
    }).catchError((e) {
      emit(EditScheduleError());
    });
  }
}
