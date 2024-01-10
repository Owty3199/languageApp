import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/common/entities/values/colors.dart';
import 'package:language_app/common/routes/pages.dart';

import 'package:language_app/global.dart';
import'common/routes/routes.dart';





Future<void> main() async {
  await Global.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocproviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 650),
          builder: (context, child) => MaterialApp(
            //remove if not working
            builder:EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: AppColors.primaryText),
                    elevation: 0,
                    backgroundColor: Colors.white,
                  ),
                ),
                onGenerateRoute: AppPages.GenerateRouteSettings,
              )),
    );
  }
}
