import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:food_ox/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:food_ox/features/auth/data/model/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  UserModel? userModel;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await dioHelper.postData(endPoint: 'auth/login', body: {
      'email': email,
      'password': password,
    }).then((response) {
      print(response.data);
      userModel = UserModel.fromJson(response.data);
      MyConfigCach.putString(key: MyConfigCacheKeys.token, value: userModel!.token!);
      MyConfigCach.putString(key: MyConfigCacheKeys.myUserName, value: userModel!.user!.username!);
      emit(LoginSuccessState());
    }).catchError((error) {
      print('Error in login is $error');
      emit(LoginErrorState());
    });
  }

  Future<void> signUp({
    required String username,
    required String password,
    required String confirmPassword,
    required String phone,
    required String email,
  }) async {
    emit(SignUpLoadingState());
    await dioHelper.postData(endPoint: 'auth/reg', body: {
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'email': email,
    }).then((response) {
      print(response.data);
      emit(SignUpSuccessState());
    }).catchError((error) {
      print('Error in login is $error');
      emit(SignUpErrorState());
    });
  }
}
