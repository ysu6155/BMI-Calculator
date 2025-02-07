import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/view_model/cubit/bmi_cubit.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppAsset.dart';
import 'package:untitled/view_model/utils/AppColor.dart';
// استيراد الكيوبت

class GenderCard extends StatelessWidget {
  final String gender;
  final String imageAsset;

  const GenderCard({
    required this.gender,
    required this.imageAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BMICalculatorCubit, BMICalculatorState>(
        builder: (context, state) {
          final cubit = context.read<BMICalculatorCubit>();
          bool isSelected = cubit.isGenderSelected(gender); // التأكد من اختيار الجنس
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: AppColor.backGroundColorBottom.withOpacity(0.3),
              highlightColor: AppColor.backGroundColorBottom.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              onTap: () {
                cubit.selectGender(gender); // حفظ الجنس عند التحديد
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: gender == 'Male'
                      ? AppColor.backGroundColorCardLight
                      : AppColor.backGroundColorGray,
                  border: Border.all(
                    color: isSelected
                        ? AppColor.backGroundColorBottom
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(12.sp),
                height: 180.sp,
                child: Column(
                  children: [
                    SvgPicture.asset(imageAsset),
                    SizedBox(height: 16.sp),
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
          );
        },
      ),
    );
  }
}
Widget buildGenderSelection(BuildContext context) {
  return BlocBuilder<BMICalculatorCubit, BMICalculatorState>(
    buildWhen: (previous, current) => current is SelectGender,
    builder: (context, state) {
      final cubit = context.read<BMICalculatorCubit>();
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            children: [
              GenderCard(
                gender: LocaleKeys.maleGender.tr(),
                imageAsset: AppAssets.male,

              ),
              SizedBox(width: 12.sp),
              GenderCard(
                gender: LocaleKeys.femaleGender.tr(),
                imageAsset: AppAssets.female,

              ),
            ],
          ),
        ),
      );
    },
  );
}