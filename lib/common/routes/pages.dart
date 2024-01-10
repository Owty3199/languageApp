//unify blockProvider and routes and pages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/common/routes/names.dart';
import 'package:language_app/global.dart';
import 'package:language_app/pages/application/application_page.dart';
import 'package:language_app/pages/application/bloc/app_blocs.dart';
import 'package:language_app/pages/home/bloc/home_blocs.dart';
import 'package:language_app/pages/home/home_page.dart';
import 'package:language_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:language_app/pages/profile/settings/settings_page.dart';
import 'package:language_app/pages/register/bloc/register_blocs.dart';
import 'package:language_app/pages/register/register.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:language_app/pages/sign_in/sign_in.dart';
import 'package:language_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:language_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )
          ),
          PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )
          ),
          PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )
          ),
    ];
  }

  static List<dynamic> allBlocproviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        print("first log ");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        //comment this if if you want to  see the starter scrrens
        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=> const ApplicationPage(), settings: settings);
          }

         
          return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
      }
      print("invalid route name ${settings.name}");

    }
     
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }

}



class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
