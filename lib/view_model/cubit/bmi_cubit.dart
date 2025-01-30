import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_state.dart';

class BMICalculatorCubit extends Cubit<BMICalculatorState> {
  BMICalculatorCubit() : super(BMICalculatorState());

  // دالة لتحديد الجنس
  void selectGender(String gender) {
    emit(state.copyWith(selectedGender: gender));
  }

  // دالة لتحديث الارتفاع
  void updateHeight(double height) {
    emit(state.copyWith(height: height));
  }

  // دالة لتحديث الوزن
  void updateWeight(num weight) {
    emit(state.copyWith(weight: weight));
  }

  // دالة لتحديث العمر
  void updateAge(int age) {
    emit(state.copyWith(age: age));
  }
}