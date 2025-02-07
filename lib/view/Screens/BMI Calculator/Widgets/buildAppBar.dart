import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';

Widget buildAppBar() {
  return Container(
    height: 55.sp,
    decoration: BoxDecoration(
      color: AppColor.backGroundColorGray,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(4, 0),
        ),
      ],
    ),
    child: Center(
      child: Text(
        LocaleKeys.bmiCalculate.tr(),
        style: TextStyle(
          color: AppColor.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}