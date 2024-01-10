import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/common/routes/routes.dart';
import 'package:language_app/common/values/constant.dart';
import 'package:language_app/global.dart';
import 'package:language_app/pages/application/bloc/app_blocs.dart';
import 'package:language_app/pages/application/bloc/app_events.dart';
import 'package:language_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:language_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:language_app/pages/profile/widgests/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add( const TriggerAppEvent(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUserData),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
