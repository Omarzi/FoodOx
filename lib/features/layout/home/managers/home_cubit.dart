import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/layout/home/data/profile_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  ProfileModel profileModel = ProfileModel();

  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    await dioHelper.getData(endPoint: 'user').then((response) {
      profileModel = ProfileModel.fromJson(response.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      emit(GetProfileDataErrorState());
    });
  }
}
