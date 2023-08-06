// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitialState());

  ScheduleCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  Future<void> makeSchedule({
    required String period,
    required String work_from,
    required String work_to,
    required String break_from,
    required String break_to,
  }) async {
    emit(ScheduleLoadingState());
    await dioHelper.postData(endPoint: 'user/schedule').then((response) {
      print(response.data);
      emit(ScheduleSuccessState());
    }).catchError((error) {
      print('Error in make schedule is $error');
      emit(ScheduleErrorState());
    });
  }
}
