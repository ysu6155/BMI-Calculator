import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';

class YourResultPage extends StatelessWidget {
  final String result;
  final String bmiCategory;
  final String resultMessage;

  YourResultPage({
    super.key,
    required this.result,
    required this.bmiCategory,
    required this.resultMessage,
  });


  Color _getBmiCategoryColor(String category) {
    if (category == LocaleKeys.underweight.tr()) {
      return AppColor.underweight;
    } else if (category ==  LocaleKeys.normal.tr()) {
      return AppColor.normal;
    } else if (category == LocaleKeys.overweight.tr()) {
      return AppColor.overweight;
    } else if (category == LocaleKeys.obese.tr()) {
      return AppColor.obesity;
    } else {
      return AppColor.textColor;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        title: Text(
          LocaleKeys.yourResult.tr(),
          style: TextStyle(
            color: AppColor.white,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: AppColor.backGroundColorGray,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 350.w,
                padding: EdgeInsets.all(24.sp),
                margin: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: AppColor.backGroundColorCardLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      LocaleKeys.yourBMI.tr(),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColor,
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      bmiCategory,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: _getBmiCategoryColor(bmiCategory), // تغيير اللون هنا
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      resultMessage,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.sp),
            ElevatedButton(
              onPressed: () {
                // العودة إلى الصفحة السابقة أو إعادة الحساب
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.backGroundColorBottom,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                padding: EdgeInsets.all(16.sp),
              ),
              child: Center(
                child: Text(
                  LocaleKeys.recalculate.tr(),
                  style: TextStyle(fontSize: 20.sp, color: AppColor.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
