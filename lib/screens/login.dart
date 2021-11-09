import 'package:crispy_app/controllers/login_cubit/login_cubit.dart';
import 'package:crispy_app/controllers/signup_cubit/signup_cubit.dart';
import 'package:crispy_app/models/all_constants.dart';
import 'package:crispy_app/models/auth_user.dart';
import 'package:crispy_app/screens/home.dart';
import 'package:crispy_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginstatus == LOGIN_STATUS.success) {
          // context.read<AuthClass>().email = state.email;
          // context.read<AuthClass>().username = state.authClass.username;
          // context.read<AuthClass>().refreshToken = state.authClass.refreshToken;
          // context.read<AuthClass>().accessToken = state.authClass.accessToken;

          Navigator.of(context).push(MaterialPageRoute(builder: (c) {
            return Home();
          }));
          // return teleport(context, HOME);
        }
      },
      builder: (context, state) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: b,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 140,

                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Crispy",
                                style: GoogleFonts.getFont('Sen',
                                    color: Colors.white, fontSize: 70),
                              ),
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         image: AssetImage("images/logo.png"),
                              //         fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                decoration: BoxDecoration(
                                    color: d6,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      enabled: state.loginstatus ==
                                              LOGIN_STATUS.submmiting
                                          ? false
                                          : true,
                                      onChanged: (email) => context
                                          .read<LoginCubit>()
                                          .fillEmail(email: email),
                                      style: TextStyle(color: w),
                                      decoration: InputDecoration(
                                          hintText: 'email',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[350],
                                              fontSize: 14.3),
                                          border: InputBorder.none)),
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                decoration: BoxDecoration(
                                    color: d6,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      enabled: state.loginstatus ==
                                              LOGIN_STATUS.submmiting
                                          ? false
                                          : true,
                                      obscureText: true,
                                      onChanged: (pass) => context
                                          .read<LoginCubit>()
                                          .fillPass(pass: pass),
                                      style: TextStyle(color: w),
                                      decoration: InputDecoration(
                                          hintText: 'password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[350],
                                              fontSize: 14.3),
                                          border: InputBorder.none)),
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("login");
                              context.read<LoginCubit>().login();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: lblue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: state.loginstatus ==
                                            LOGIN_STATUS.submmiting
                                        ? SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircularProgressIndicator(
                                              color: b,
                                            ),
                                          )
                                        : state.loginstatus ==
                                                LOGIN_STATUS.error
                                            ? Text(
                                                state.errormessage.toString(),
                                                style: GoogleFonts.getFont(
                                                    "Questrial",
                                                    color: b,
                                                    fontSize: 14),
                                              )
                                            : Text(
                                                "Log in ",
                                                style: GoogleFonts.getFont(
                                                    "Questrial",
                                                    color: b,
                                                    fontSize: 17),
                                              ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: d6,
                                  height: 1.2,
                                  child: Text("_________________"),
                                ),
                                Text(
                                  "Dont have an account? ",
                                  style: GoogleFonts.getFont("Questrial",
                                      color: d11, fontSize: 13),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("signup");
                                    // teleport(context, SIGNUP);
                                    AuthUser authUser = AuthUser();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (c) {
                                      return BlocProvider<SignupCubit>(
                                        create: (newcontext) =>
                                            SignupCubit(authUser),
                                        child: Signupscreen(),
                                      );
                                    }));
                                  },
                                  child: Text(
                                    "Signup ",
                                    style: GoogleFonts.getFont("Questrial",
                                        color: w, fontSize: 13),
                                  ),
                                ),
                                Container(
                                  color: d6,
                                  height: 1.2,
                                  child: Text("_________________"),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              )),
        ),
      ),
    );
  }
}
