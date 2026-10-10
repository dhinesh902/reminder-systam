import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

Future<DateTime?> selectGlobalDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(primary: AppColors.primaryBlue),
          useMaterial3: false,
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: AppColors.primaryBlue,
            headerForegroundColor: Colors.white,
            backgroundColor: Colors.white,
            weekdayStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            dayStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          dialogTheme: DialogThemeData(backgroundColor: Colors.white),
        ),
        child: child!,
      );
    },
  );
}

Future<DateTimeRange?> selectGlobalDateRange(BuildContext context) async {
  return await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          focusColor: AppColors.primaryBlue,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryBlue,
            onPrimary: Colors.white,
            surface: Colors.white,
          ),
          useMaterial3: false,
        ),
        child: Transform.scale(scale: .9, child: child),
      );
    },
  );
}
