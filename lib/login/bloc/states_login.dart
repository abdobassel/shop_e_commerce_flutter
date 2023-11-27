abstract class LoginStates {}

class LoginitStates extends LoginStates {}

class LoginSuccesStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginErrorStates extends LoginStates {
  final String error;
  LoginErrorStates(this.error);
}
