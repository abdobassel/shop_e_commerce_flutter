import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/bloc/states_login.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(super.initialState);
  static LoginCubit get(context) => BlocProvider.of(context);
}
