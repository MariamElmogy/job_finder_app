import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/models/user_model.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../cubits/register_cubit/register_cubit.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../utils/app_colors.dart';

class CustomRegisterButton extends StatefulWidget {
  const CustomRegisterButton(
      {super.key,
      required this.isButtonEnabled,
      this.onPressed,
      required this.text});
  final bool isButtonEnabled;
  final String text;
  final void Function()? onPressed;

  @override
  State<CustomRegisterButton> createState() => _CustomRegisterButtonState();
}

class _CustomRegisterButtonState extends State<CustomRegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isButtonEnabled
              ? AppColors.kRegisterButtonEnable
              : AppColors.kRegisterDisableBackrgound,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isButtonEnabled
                ? Colors.white
                : AppColors.kRegisterButtonDisable,
            fontSize: 16,
            fontFamily: AppFonts.kRegisterButton,
          ),
        ),
      ),
    );
  }
}
