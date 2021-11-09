import 'package:bloc/bloc.dart';
import 'package:crispy_app/models/all_constants.dart';
import 'package:crispy_app/models/auth_user.dart';
import 'package:meta/meta.dart';

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
}
