abstract class LoginStates {}

class LoginitState extends LoginStates {}

class LoginSuccesState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginChangPasswordShowState extends LoginStates {}
