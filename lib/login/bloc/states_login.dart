import 'package:shop_app/models/shoploginModels/login_model.dart';

abstract class LoginStates {}

class LoginitState extends LoginStates {}

class LoginSuccesState extends LoginStates {
  final ShopLoginModel? shopLoginModel;

  LoginSuccesState({this.shopLoginModel});
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginChangPasswordShowState extends LoginStates {}
