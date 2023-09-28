import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ? const CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xff3366FF),
            child: CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Color(0xff3366FF),
              ),
            ),
          )
        : const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.kBoarderColor,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
            ),
          );
  }
}
