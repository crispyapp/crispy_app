part of 'signup_cubit.dart';

class SignupState {
  String email;
  String username;
  String password;
  SIGNUP_STATUS signupstatus;
  String errormessage = "none";
  SignupState(
      {required this.email,
      required this.username,
      required this.password,
      required this.signupstatus,
      required this.errormessage});

  factory SignupState.initial() {
    return SignupState(
        email: "",
        username: "",
        password: "",
        signupstatus: SIGNUP_STATUS.initial,
        errormessage: "none");
  }

  bool? get stringify => true;

  List<Object?> get props => [email, username, password, signupstatus];

  SignupState copyWith({
    String? email,
    String? username,
    String? password,
    String? errormessage,
    SIGNUP_STATUS? signupstatus,
  }) {
    return SignupState(
      errormessage: errormessage ?? this.errormessage,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      signupstatus: signupstatus ?? this.signupstatus,
    );
  }
}
