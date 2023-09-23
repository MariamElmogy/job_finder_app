import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../utils/app_colors.dart';
import 'apply_job_form.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.widget,
  });

  final ApplyJobForm widget;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: widget.autovalidateMode,
      validator: (value) {
        if (value == null || !value.isValidNumber()) {
          return 'Please enter your phone';
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: 'No.Handphone',
        labelStyle: TextStyle(
          color: AppColors.kRegisterHints,
          fontSize: 14,
          fontFamily: AppFonts.kRegisterHintFont,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.kBoarderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.kBorderFocusColor,
          ),
        ),
        // 4- the error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color(0xffFF472B),
          ),
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        // print(phone.completeNumber);
      },
      disableLengthCheck: true,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
    );
  }
}
