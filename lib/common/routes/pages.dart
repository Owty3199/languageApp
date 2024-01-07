//unify blockProvider and routes and pages
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/common/routes/names.dart';
import 'package:language_app/pages/register/bloc/register_blocs.dart';
import 'package:language_app/pages/register/register.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:language_app/pages/sign_in/sign_in.dart';
import 'package:language_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:language_app/pages/welcome/welcome.dart';

class AppPages {
  List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.INITIAL, 
      page: const Welcome(), 
      bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
       PageEntity(
      route: AppRoutes.SIGN_IN, 
      page: const SignIn(), 
      bloc: BlocProvider(create: (_)=>SignInBloc(),)
      ),
       PageEntity(
      route: AppRoutes.REGISTER, 
      page: const Register(), 
      bloc: BlocProvider(create: (_)=>RegisterBlocs(),)
      ),
       PageEntity(
      route: AppRoutes.APPLICATION, 
      page: const Welcome(), 
      // bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
      ];
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}
