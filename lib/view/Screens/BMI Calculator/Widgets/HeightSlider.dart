import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view_model/cubit/bmi_cubit.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';

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
        children: [
          Text(
            LocaleKeys.height.tr(),
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
                      color: AppColor.white, fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: LocaleKeys.cm.tr(),
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

// ✅ دالة `buildHeightSlider` لإعادة بناء الواجهة عند تحديث الطول
Widget buildHeightSlider(BuildContext context) {
  return BlocBuilder<BMICalculatorCubit, BMICalculatorState>(
    buildWhen: (previous, current) => current is UpdateHeight,
    builder: (context, state) {
      final height = (state is UpdateHeight) ? state.height : context.watch<BMICalculatorCubit>().height;
      return HeightSlider(
        height: height,
        onHeightChanged: (double value) {
          context.read<BMICalculatorCubit>().updateHeight(value);
        },
      );
    },
  );
}
