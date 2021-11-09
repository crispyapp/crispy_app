part of 'login_cubit.dart';

class LoginState {
  String email;
  String password;
  String errormessage = "none";

  LOGIN_STATUS loginstatus;
  LoginState(
      {required this.email,
      required this.password,
      required this.loginstatus,
      required this.errormessage});

  factory LoginState.initial() {
    return LoginState(
        email: "",
        password: "",
        loginstatus: LOGIN_STATUS.initial,
        errormessage: "none");
  }

  bool? get stringify => true;
  List<Object?> get props => [
        email,
        password,
        loginstatus,
      ];

  LoginState copyWith(
      {String? email,
      String? password,
      LOGIN_STATUS? loginstatus,
      String? errormessage}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginstatus: loginstatus ?? this.loginstatus,
        errormessage: errormessage ?? this.errormessage);
  }
}
