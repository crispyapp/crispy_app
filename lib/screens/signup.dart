import 'dart:core';

import 'package:crispy_app/controllers/signup_cubit/signup_cubit.dart';
import 'package:crispy_app/models/all_constants.dart';
import 'package:crispy_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.signupstatus == SIGNUP_STATUS.success) {
          // context.read<AuthClass>().email = state.email;
          // context.read<AuthClass>().username = state.authClass.username;
          // context.read<AuthClass>().refreshToken = state.authClass.refreshToken;
          // context.read<AuthClass>().accessToken = state.authClass.accessToken;
          Navigator.of(context).push(MaterialPageRoute(builder: (c) {
            return Home();
          }));
        }
      },
      builder: (context, state) => Scaffold(
          backgroundColor: b,
          body: Center(
            child: SingleChildScrollView(
              // ignore: prefer_const_constructors
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                                    onChanged: (value) => context
                                        .read<SignupCubit>()
                                        .fillUsername(value),
                                    style: TextStyle(color: w),
                                    decoration: InputDecoration(
                                        hintText: 'username',
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
                                    onChanged: (value) => context
                                        .read<SignupCubit>()
                                        .fillEmail(value),
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
                                    onChanged: (value) => context
                                        .read<SignupCubit>()
                                        .fillPassword(value),
                                    obscureText: true,
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
                            context.read<SignupCubit>().signup();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: lblue,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: state.signupstatus ==
                                          SIGNUP_STATUS.submmiting
                                      ? SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(
                                            color: b,
                                          ),
                                        )
                                      : state.signupstatus ==
                                              SIGNUP_STATUS.error
                                          ? Text(
                                              state.errormessage.toString(),
                                              style: GoogleFonts.getFont(
                                                  "Questrial",
                                                  color: b,
                                                  fontSize: 14),
                                            )
                                          : Text(
                                              "Sign Up ",
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
                                " have an account? ",
                                style: GoogleFonts.getFont("Questrial",
                                    color: d11, fontSize: 13),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // print("Login");
                                  // teleport(context, LOGIN);
                                },
                                child: Text(
                                  "Login ",
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
            ),
          )),
    );
  }
}
