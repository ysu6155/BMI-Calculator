import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view/Screens/BMI%20Calculator/Widgets/AgeCard.dart';
import 'package:untitled/view_model/cubit/bmi_cubit.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';
import 'package:untitled/view_model/utils/AppColor.dart';



class WeightCard extends StatelessWidget {
  final num value;  // تعديل النوع إلى double لتمكين الكسور العشرية
  final void Function() onIncrement;
  final void Function() onDecrement;

  const WeightCard({
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
        color: AppColor.backGroundColorCardLight,
      ),
      padding: EdgeInsets.all(16.sp),
      height: 180.sp,
      child: Column(
        spacing: 10.sp,
        children: [
          Text(
            LocaleKeys.width.tr(),
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 20.sp,
            ),
          ),
          Text(
            value.toStringAsFixed(1),  // عرض مع خانة عشرية واحدة
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
Widget buildWeightAndAgeCards(BuildContext context) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(16.sp),
      child: Row(
        children: [
          // Weight Card
          Expanded(
            child: BlocBuilder<BMICalculatorCubit, BMICalculatorState>(
              buildWhen: (previous, current) => current is UpdateWeight,
              builder: (context, state) {
                final cubit = context.read<BMICalculatorCubit>();
                return WeightCard(
                  value: cubit.weight,
                  onIncrement: () {
                    cubit.updateWeight(cubit.weight + 0.1);
                  },
                  onDecrement: () {
                    cubit.updateWeight(cubit.weight - 0.1);
                  },
                );
              },
            ),
          ),
          SizedBox(width: 12.sp),
          // Age Card
          Expanded(
            child: BlocBuilder<BMICalculatorCubit, BMICalculatorState>(
              buildWhen: (previous, current) => current is UpdateAge,
              builder: (context, state) {
                final cubit = context.read<BMICalculatorCubit>();
                return AgeCard(
                  value: cubit.age,
                  onIncrement: () {
                    cubit.updateAge(cubit.age + 1);
                  },
                  onDecrement: () {
                    cubit.updateAge(cubit.age - 1);
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
