import 'package:flutter_bloc/flutter_bloc.dart';

class BMICalculatorState {
  final String selectedGender;
  final double height;
  final num weight;
  final int age;

  BMICalculatorState({
    this.selectedGender = 'Male',
    this.height = 170.0,
    this.weight = 70,
    this.age = 25,
  });

  BMICalculatorState copyWith({
    String? selectedGender,
    double? height,
    num? weight,
    int? age,
  }) {
    return BMICalculatorState(
      selectedGender: selectedGender ?? this.selectedGender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}