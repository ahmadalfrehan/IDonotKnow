class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String success;
  LoginSuccessState(this.success);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class CreateSuccessState extends LoginStates {}

class CreateErrorState extends LoginStates {
  final String error;

  CreateErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}
