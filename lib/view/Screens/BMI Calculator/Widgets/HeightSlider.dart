import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../view_model/utils/AppColor.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;

  const HeightSlider({
    required this.height,
    required this.onHeightChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      decoration: BoxDecoration(
        color: AppColor.backGroundColorGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        spacing: 10.sp,
        children: [
          Text(
            "Height",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 20.sp,
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: height.toStringAsFixed(2),
                  style: TextStyle(
                      color: AppColor.white, fontSize: 40.sp,fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'cm',
                  style: TextStyle(
                      color: AppColor.white, fontSize: 20.sp),
                ),
              ],
            ),
          ),
          Slider(
            activeColor: AppColor.backGroundColorBottom,
            max: 220,
            min: 50,
            value: height,
            onChanged: onHeightChanged,
          )
        ],
      ),
    );
  }
}