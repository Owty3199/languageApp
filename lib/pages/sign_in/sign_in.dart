import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:language_app/pages/sign_in/sign_in_controller.dart';
import 'package:language_app/pages/common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIntState();
}

class _SignIntState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Login"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusableText(
                            "Or use your email account to Log In")),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          SizedBox(height: 5.h),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(height: 5.h),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          })
                        ],
                      ),
                    ),
                    forgotPassword(),
                    SizedBox(height: 6.h,),
                    buildlogInAndRegButton("Log In", "login", () {
                       SignInController(context: context).handleSignIn("email");

                    }),
                    buildlogInAndRegButton("Sign Up", "register", () {
                      Navigator.of(context).pushNamed("/register");

                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
