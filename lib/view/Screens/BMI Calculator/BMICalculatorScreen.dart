
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/cubit/bmi_cubit.dart';
import '../../../view_model/utils/AppAsset.dart';
import '../../../view_model/utils/AppColor.dart';
import '../Your Result/YourResult.dart';
import 'Widgets/GenderCard.dart';
import 'Widgets/HeightSlider.dart';
import 'Widgets/WeightAgeCard.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55.sp,
              decoration: BoxDecoration(
                color: AppColor.backGroundColorGray,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  spacing: 12,
                  children: [
                    GenderCard(
                      gender: 'Male',
                      imageAsset: AppAssets.male,
                      onTap: () {
                        context.read<BMICalculatorCubit>().selectGender('Male');
                      },
                      isSelected: context.watch<BMICalculatorCubit>().state.selectedGender == 'Male',
                    ),
                    GenderCard(
                      gender: 'Female',
                      imageAsset: AppAssets.female,
                      onTap: () {
                        context.read<BMICalculatorCubit>().selectGender('Female');
                      },
                      isSelected: context.watch<BMICalculatorCubit>().state.selectedGender == 'Female',
                    ),
                  ],
                ),
              ),
            ),
            HeightSlider(
              height: context.watch<BMICalculatorCubit>().state.height,
              onHeightChanged: (double value) {
                context.read<BMICalculatorCubit>().updateHeight(value);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: WeightAgeCard(
                        label: "Weight",
                        value: context.watch<BMICalculatorCubit>().state.weight,
                        onIncrement: () {
                          context.read<BMICalculatorCubit>().updateWeight(
                              context.read<BMICalculatorCubit>().state.weight + 0.1);
                        },
                        onDecrement: () {
                          context.read<BMICalculatorCubit>().updateWeight(
                              context.read<BMICalculatorCubit>().state.weight - 0.1);
                        },
                      ),
                    ),
                    Expanded(
                      child: WeightAgeCard(
                        label: "Age",
                        value: context.watch<BMICalculatorCubit>().state.age,
                        onIncrement: () {
                          context.read<BMICalculatorCubit>().updateAge(
                              context.read<BMICalculatorCubit>().state.age + 1);
                        },
                        onDecrement: () {
                          context.read<BMICalculatorCubit>().updateAge(
                              context.read<BMICalculatorCubit>().state.age - 1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.backGroundColorBottom,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // تحديد نصف القطر
                  ),
                ),
                onPressed: () {
                  final bmiCubit = context.read<BMICalculatorCubit>();
                  final height = bmiCubit.state.height;
                  final weight = bmiCubit.state.weight;
                  final age = bmiCubit.state.age;

                  // حساب مؤشر كتلة الجسم (BMI)
                  final bmi = weight / ((height / 100) * (height / 100));

                  // تحديد فئة BMI
                  String bmiCategory;
                  String resultMessage;

                  if (bmi < 18.5) {
                    bmiCategory = "Underweight";
                    resultMessage = "You are underweight. Try to gain some weight.";
                  } else if (bmi >= 18.5 && bmi <= 24.9) {
                    bmiCategory = "Normal";
                    resultMessage = "Your weight is normal. Keep it up!";
                  } else if (bmi >= 25 && bmi <= 29.9) {
                    bmiCategory = "Overweight";
                    resultMessage = "You are overweight. Consider losing weight.";
                  } else {
                    bmiCategory = "Obese";
                    resultMessage = "You are obese. It's recommended to lose weight.";
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourResultPage(
                        result: bmi.toStringAsFixed(2),
                        bmiCategory: bmiCategory,
                        resultMessage: resultMessage,
                      ),
                    ),
                  );
                },
                child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}