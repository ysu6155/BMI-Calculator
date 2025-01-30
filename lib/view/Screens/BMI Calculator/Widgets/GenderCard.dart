import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../view_model/utils/AppColor.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final String imageAsset;
  final void Function() onTap;
  final bool isSelected; // خاصية لتحديد إذا كان الجنس مختاراً أم لا

  const GenderCard({
    required this.gender,
    required this.imageAsset,
    required this.onTap,
    required this.isSelected,  // إضافة الخاصية
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColor.backGroundColorBottom.withOpacity(0.3),
          highlightColor: AppColor.backGroundColorBottom.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: gender == 'Male'
                  ? AppColor.backGroundColorCardLight
                  : AppColor.backGroundColorGray,
              border: Border.all(
                color: isSelected
                    ? AppColor.backGroundColorBottom  // تغيير الإطار عند اختيار الجنس
                    : Colors.transparent,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(12.sp),
            height: 180.sp,
            child: Column(
              spacing: 16.sp,
              children: [
                SvgPicture.asset(imageAsset),
                Text(
                  gender,
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
