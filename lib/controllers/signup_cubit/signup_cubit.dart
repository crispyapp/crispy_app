import 'package:bloc/bloc.dart';
import 'package:crispy_app/models/all_constants.dart';
import 'package:crispy_app/models/auth_user.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthUser authUser;
  SignupCubit(this.authUser) : super(SignupState.initial());

  void fillUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void fillEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void fillPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void signup() async {
    emit(state.copyWith(signupstatus: SIGNUP_STATUS.submmiting));
    try {
      await authUser.signUpWithEmailPass(state.email, state.password);

      if (authUser.loginStatus == false) {
        emit(state.copyWith(
            signupstatus: SIGNUP_STATUS.error, errormessage: authUser.error));
        return;
      }

      emit(state.copyWith(signupstatus: SIGNUP_STATUS.success));
    } catch (e) {
      emit(state.copyWith(
          signupstatus: SIGNUP_STATUS.error, errormessage: "error"));
    }
  }
}
