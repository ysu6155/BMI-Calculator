import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MyApp.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
