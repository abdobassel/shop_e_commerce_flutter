import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/apiDio/apidio.dart';
import 'package:shop_app/endpoints/endpoint.dart';

import 'package:shop_app/login/regCubit/bloc/states_register.dart';
import 'package:shop_app/models/shoploginModels/login_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(super.initialState);

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool ispassword = true;
  ShopLoginModel? shopLoginModel;

  void changeShowPassword() {
    ispassword = !ispassword;
    emit(RegisterChangPasswordShowState());
  }

  void postRegister(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    emit(RegisterLoadingState());
    await DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
      lang: 'ar',
    ).then((value) {
      print(value.data!);
      shopLoginModel = ShopLoginModel.fromJson(value.data!);
      //object to access data
      print(shopLoginModel?.data?.token.toString());

      emit(RegisterSuccesState(shopRegisterModel: shopLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}
