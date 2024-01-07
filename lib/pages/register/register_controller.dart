import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/common/widgets/flutter_toast.dart';
import 'package:language_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "user name can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "password can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "please Confirme your password");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "an email has been sent to your registred email, to activate it please check your email Box and click on the link");
        Navigator.of(context).pop();

      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
        return;
      }else  if (e.code == 'wemail-already-in-use') {
        toastInfo(msg: "the email is already in use in an other account");
        return;
      }else  if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
        return;
      }

      
    }
  }
}
