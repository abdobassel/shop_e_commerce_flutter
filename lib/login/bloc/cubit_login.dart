import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/login/bloc/states_login.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(super.initialState);
  static LoginCubit get(context) => BlocProvider.of(context);

  bool ispassword = true;

  void changeShowPassword() {
    ispassword = !ispassword;
    emit(LoginChangPasswordShowState());
  }

  void postLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(LoginSuccesState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
