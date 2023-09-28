import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';

import '../../../../utils/app_fonts.dart';
import 'custom_radio_button.dart';

class TypeOfWorkChoices extends StatefulWidget {
  const TypeOfWorkChoices({
    super.key,
    required this.onWorkTypeSelected,
  });
  final Function(String)
      onWorkTypeSelected; // Callback function to notify the parent widget

  @override
  State<TypeOfWorkChoices> createState() => _TypeOfWorkChoicesState();
}

class _TypeOfWorkChoicesState extends State<TypeOfWorkChoices> {
  bool isSelected = false;
  String selectedWorkType = '';

  List<String> works = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphik Designer',
    'Front-End Developer'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffD6E4FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected
                  ? AppColors.kBorderFocusColor
                  : AppColors.kBoarderColor),
        ),
        child: ListTile(
            title: Text(
              works[0],
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff111827),
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
            subtitle: const Text(
              'CV.pdf • Portfolio.pdf',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
                fontFamily: AppFonts.kLoginSubHeadlineFont,
              ),
            ),
            trailing: CustomRadioButton(isSelected: isSelected),
            onTap: () {
              setState(() {
                isSelected = !isSelected;
                if (isSelected) {
                  selectedWorkType = works[0]; // Set the selected work type
                  widget.onWorkTypeSelected(selectedWorkType);
                } else {
                  selectedWorkType = ''; // Deselect the work type
                }
              });
            },
          ),
        
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       isSelected = !isSelected;
    //       if (isSelected) {
    //         selectedWorkType = works[0]; // Set the selected work type
    //       } else {
    //         selectedWorkType = ''; // Deselect the work type
    //       }
    //     });
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
    //     child: Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height * 0.11,
    //       padding: const EdgeInsets.all(16.0),
    //       decoration: BoxDecoration(
    //         color: isSelected ? const Color(0xffD6E4FF) : Colors.white,
    //         borderRadius: BorderRadius.circular(8),
    //         border: Border.all(
    //             color: isSelected
    //                 ? AppColors.kBorderFocusColor
    //                 : AppColors.kBoarderColor),
    //       ),
    //       child: Stack(
    //         children: [
    //           Text(
    //             works[0],
    //             style: const TextStyle(
    //               fontSize: 16,
    //               color: Color(0xff111827),
    //               fontFamily: AppFonts.kLoginHeadlineFont,
    //             ),
    //           ),
    //           const Positioned(
    //             // right: 100,
    //             bottom: -1,
    //             child: Text(
    //               'CV.pdf • Portfolio.pdf',
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 color: Color(0xff6B7280),
    //                 fontFamily: AppFonts.kLoginSubHeadlineFont,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             right: 1,
    //             bottom: 1,
    //             top: 1,
    //             child: CustomRadioButton(
    //               isSelected: isSelected,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
