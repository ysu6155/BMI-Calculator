import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';


class AgeCard extends StatelessWidget {
  final num value;  // تعديل النوع إلى double لتمكين الكسور العشرية
  final void Function() onIncrement;
  final void Function() onDecrement;

  const AgeCard({
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColor.backGroundColorGray,
      ),
      padding: EdgeInsets.all(16.sp),
      height: 180.sp,
      child: Column(
        spacing: 10.sp,
        children: [
          Text(
            LocaleKeys.age.tr(),
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 20.sp,
            ),
          ),
          Text(
            value.toStringAsFixed(0),  // عرض مع خانة عشرية واحدة
            style: TextStyle(
                color: AppColor.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.grey,
                child: IconButton(
                  onPressed: onDecrement,
                  icon: Icon(
                    Icons.remove,
                    color: AppColor.white,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColor.grey,
                child: IconButton(
                  onPressed: onIncrement,
                  icon: Icon(
                    Icons.add,
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
