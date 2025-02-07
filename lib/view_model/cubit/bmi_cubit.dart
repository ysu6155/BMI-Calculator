import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/view_model/service/local/shared_keys.dart';
import 'package:untitled/view_model/service/local/shared_prefs_helper.dart';
import 'package:untitled/view_model/translations/locale_keys.g.dart';

part 'bmi_state.dart';

class BMICalculatorCubit extends Cubit<BMICalculatorState> {
  BMICalculatorCubit() : super(BMICalculatorInitial());

  String selectedGender = SharedHelper.get(SharedKeys.gender)??'Male';
  double height = SharedHelper.get(SharedKeys.height)??160;
  double weight = SharedHelper.get(SharedKeys.wight) ??60;
  int age =  SharedHelper.get(SharedKeys.age)??21 ;

  Future<void> loadGenderPreference() async {
    final savedGender = SharedHelper.get(SharedKeys.gender);
    if (savedGender != null) {
      selectedGender = savedGender;
      emit(SelectGender(selectedGender));
    }
  }
  bool isGenderSelected(String gender) {
    return selectedGender == gender;
  }
  // اختيار الجنس
  void selectGender(String gender) {
    selectedGender = gender;
    SharedHelper.sava(SharedKeys.gender, selectedGender);
    emit(SelectGender(selectedGender));
  }

  // تحديث الطول
  void updateHeight(double newHeight) {
    height = newHeight;
    SharedHelper.sava(SharedKeys.height, height);
    emit(UpdateHeight(height));
  }

  // تحديث الوزن
  void updateWeight(double newWeight) {
    if (newWeight > 0) {
      weight = newWeight;
      SharedHelper.sava(SharedKeys.wight,weight);
      emit(UpdateWeight(weight));
    }
  }

  // تحديث العمر
  void updateAge(int newAge) {
    if (newAge > 0) {
      age = newAge;
      SharedHelper.sava(SharedKeys.age, age);
      emit(UpdateAge(age));
    }
  }

  // حساب مؤشر كتلة الجسم BMI

  void calculateBMI(double height, double weight) {
    if (height <= 0 || weight <= 0) return;

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    String category;
    String message;

    if (bmi < 18.5) {
      category = LocaleKeys.underweight.tr();
      message = LocaleKeys.underweightMessage.tr();
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = LocaleKeys.normal.tr();
      message = LocaleKeys.normalMessage.tr();
    } else if (bmi >= 25 && bmi < 29.9) {
      category = LocaleKeys.overweight.tr();
      message = LocaleKeys.overweightMessage.tr();
    } else {
      category = LocaleKeys.obese.tr();
      message = LocaleKeys.obeseMessage.tr();
    }

    emit(ShowBMIResult(bmi, category, message));
  }

}
