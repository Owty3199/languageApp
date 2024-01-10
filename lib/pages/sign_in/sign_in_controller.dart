import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:language_app/common/apis/user_api.dart';
import 'package:language_app/common/entities/entities.dart';
import 'package:language_app/common/values/constant.dart';
import 'package:language_app/common/widgets/flutter_toast.dart';
import 'package:language_app/global.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You have to fill the field: Email Address");
          return;
        }

        if (password.isEmpty) {
          toastInfo(msg: "You have to fill the field: Password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          // Check for user existence and email verification
          if (credential.user == null) {
            toastInfo(msg: "You don't have an account, please register first");
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your Email Account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email= email;
            loginRequestEntity.open_id=id;
            loginRequestEntity.type=1;
            
            print("User exists");
            asyncPostAllData(loginRequestEntity);
            Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, "Azerty@123");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            // Handle the case when the login is successful
          } else {
            toastInfo(msg: "You are not a user of this app");
            return;
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password for that user");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email format is wrong");
            return;
            
          } else if (e.code == 'invalid-credential') {
            toastInfo(msg: "Invalid credential. Please check your credentials.");
            return;
          } else {
            print("Unhandled FirebaseAuthException: $e");
            toastInfo(msg: "An unexpected error occurred");
            return;
          }
        }
      }
    } catch (e) {
      print("Unhandled exception: $e");
      // Handle other exceptions or errors
    }
  }

Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  EasyLoading.show(
    indicator: CircularProgressIndicator(),
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true
  );
   var result = await UserAPI.login(params:loginRequestEntity);
}

}
