import 'package:crispy_app/controllers/login_cubit/login_cubit.dart';
import 'package:crispy_app/controllers/signup_cubit/signup_cubit.dart';
import 'package:crispy_app/models/auth_user.dart';
import 'package:crispy_app/screens/home.dart';
import 'package:crispy_app/screens/login.dart';
import 'package:crispy_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyCrispy());
}

class MyCrispy extends StatelessWidget {
  MyCrispy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUser authUser = AuthUser();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<LoginCubit>(
            create: (newcontext) => LoginCubit(authUser),
            child: Loginscreen()));
  }
}




// BlocProvider<SignupCubit>(
//         create: (newcontext) => SignupCubit(authUser),
//         child: Signupscreen(),
//       ),