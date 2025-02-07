import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view/Screens/Your%20Result/YourResult.dart';
import 'package:untitled/view_model/cubit/bmi_cubit.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';

Widget buildCalculateButton(BuildContext context) {
  return BlocListener<BMICalculatorCubit, BMICalculatorState>(
    listenWhen: (previous, current) => current is ShowBMIResult,
    listener: (context, state) {
      if (state is ShowBMIResult) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YourResultPage(
              result: state.bmi.toStringAsFixed(2),
              bmiCategory: state.bmiCategory,
              resultMessage: state.resultMessage,
            ),
          ),
        );
      }
    },
    child: SizedBox(
      height: 60.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.backGroundColorBottom,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 4,
        ),
        onPressed: () {
          context.read<BMICalculatorCubit>().calculateBMI(
            context.read<BMICalculatorCubit>().height,
            context.read<BMICalculatorCubit>().weight,
          );
        },
        child: Center(
          child: Text(
            LocaleKeys.calculate.tr(),
            style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
        ),
      ),
    ),
  );
}