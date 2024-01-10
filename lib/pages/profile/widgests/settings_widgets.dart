import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/common/entities/values/colors.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar(){
  return AppBar(
    title:Container(
      child: Container(
        child: reusableText("Settings")
      ),
    )
  );
}
Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure about logging out ?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: func,
                            child: const Text("Confirm"),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage("assets/icons/Logout.png"))),
                    )
                  ],
                ),
              ),
            );
}