import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/utils/AppColor.dart';

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
    switch (category) {
      case 'Underweight':
        return AppColor.underweight;
      case 'Normal':
        return AppColor.normal;
      case 'Overweight':
        return AppColor.overweight;
      case 'Obese':
        return AppColor.obesity;
      default:
        return AppColor.textColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Your Result',
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
                      "Your BMI",
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
                  "Re - Calculate",
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
