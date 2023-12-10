import 'package:shop_app/models/shoploginModels/login_model.dart';

abstract class RegisterStates {}

class RegisteritState extends RegisterStates {}

class RegisterSuccesState extends RegisterStates {
  final ShopLoginModel? shopRegisterModel;

  RegisterSuccesState({this.shopRegisterModel});
}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterChangPasswordShowState extends RegisterStates {}
