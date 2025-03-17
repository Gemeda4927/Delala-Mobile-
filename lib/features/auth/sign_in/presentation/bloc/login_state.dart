abstract class LoginState {
  final bool isPasswordVisible;

  LoginState({this.isPasswordVisible = false});
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
