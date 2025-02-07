import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/view/Screens/BMI%20Calculator/Widgets/buildAppBar.dart';
import 'package:untitled/view_model/utils/AppColor.dart';
import 'Widgets/GenderCard.dart';
import 'Widgets/HeightSlider.dart';
import 'Widgets/WeightCard.dart';
import 'Widgets/buildCalculateButton.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale("en"));
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            buildAppBar(),
            // Gender Selection
            buildGenderSelection(context),
            // Height Slider
            buildHeightSlider(context),
            // Weight and Age Cards
            buildWeightAndAgeCards(context),
            // Calculate Button
            buildCalculateButton(context),
          ],
        ),
      ),
    );
  }

}