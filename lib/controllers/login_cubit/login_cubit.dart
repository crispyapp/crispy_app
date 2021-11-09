import 'package:bloc/bloc.dart';
import 'package:crispy_app/models/all_constants.dart';
import 'package:crispy_app/models/auth_user.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthUser authUser;
  LoginCubit(this.authUser) : super(LoginState.initial());

  void fillEmail({required String email}) {
    emit(state.copyWith(email: email, loginstatus: LOGIN_STATUS.initial));
  }

  void fillPass({required String pass}) {
    emit(state.copyWith(password: pass, loginstatus: LOGIN_STATUS.initial));
  }

  void login() async {
    emit(state.copyWith(loginstatus: LOGIN_STATUS.submmiting));
    try {
      // await authClass.login(email: state.email, password: state.password);
      // state.authClass = authClass;

      await authUser.loginWithEmailPass(state.email, state.password);

      if (authUser.loginStatus == false) {
        emit(state.copyWith(
            loginstatus: LOGIN_STATUS.error, errormessage: authUser.error));
        return;
      }
      emit(state.copyWith(loginstatus: LOGIN_STATUS.success));
    } catch (e) {
      emit(state.copyWith(
          loginstatus: LOGIN_STATUS.error, errormessage: "error"));
    }
  }
}
