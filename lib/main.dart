import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:language_app/common/entities/values/colors.dart';
import 'package:language_app/firebase_options.dart';
import 'package:language_app/pages/application/application_page.dart';
import 'package:language_app/pages/boloc_providers.dart';
import 'package:language_app/pages/register/register.dart';
import 'package:language_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:language_app/pages/sign_in/sign_in.dart';
import 'package:language_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:language_app/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocproviders.allBlocproviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: const ApplicationPage(),
          routes: {
            // "myHomePage": (context) => const MyHomePage(title: "Home Page"),
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register(),
          },
        )
      ),
    );
  }
}

