import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:language_app/app_bloc.dart';
import 'package:language_app/pages/register/bloc/register_blocs.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:language_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocproviders {
  static get allBlocproviders => [
    BlocProvider(create: (context) => WelcomeBloc(),),
    // BlocProvider(create: (context) => AppBloc(),),
    BlocProvider(create: (context) => SignInBloc(),),
    BlocProvider(create: (context) => RegisterBlocs(),),
        
  ];
}