import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/endpoints/endpoint.dart';
import 'package:shop_app/login/bloc/states_login.dart';
import 'package:shop_app/models/shoploginModels/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(super.initialState);

  static LoginCubit get(context) => BlocProvider.of(context);

  bool ispassword = true;
  ShopLoginModel? shopLoginModel;

  void changeShowPassword() {
    ispassword = !ispassword;
    emit(LoginChangPasswordShowState());
  }

//10.0.2.2
  void postLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
      lang: 'ar',
    ).then((value) {
      print(value.data!);
      shopLoginModel = ShopLoginModel.fromJson(value.data!);
      //object to access data
      print(shopLoginModel?.data?.token.toString());

      emit(LoginSuccesState(shopLoginModel: shopLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
