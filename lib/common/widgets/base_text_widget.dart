import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_app/common/entities/values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize.sp,
    ),
  );
}