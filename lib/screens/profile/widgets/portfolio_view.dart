import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../utils/app_fonts.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Portfolio',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add portfolio here',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff111827),
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  // onTap: onTap,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    color: const Color(0xff3366FF),
                    strokeWidth: 2,
                    dashPattern: const [8, 4],
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffECF2FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          // fileName != null
                          // ?
                          CircleAvatar(
                              backgroundColor: const Color(0xffD6E4FF),
                              radius: 30,
                              child: Image.asset(AppImages.kDocument)),
                          // : CircleAvatar(
                          //     radius: 30,
                          //     backgroundColor: const Color(0xffD6E4FF),
                          //     child: Image.asset(AppImages.kDocument),
                          //   ),
                          const SizedBox(height: 10),
                          const Text(
                            ' Upload your other file',
                            style: TextStyle(
                              color: Color(0xff111827),
                              fontFamily: AppFonts.kLoginHeadlineFont,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Max. file size 10 MB',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontFamily: AppFonts.kLoginSubHeadlineFont,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: const Color(0xff3366FF),
                              ),
                              color: const Color(0xffD6E4FF),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.kExportColor),
                                const SizedBox(width: 10),
                                const Text(
                                  'Add file',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff3366FF),
                                    fontFamily: AppFonts.kLoginHeadlineFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffD1D5DB),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(AppImages.kPDF),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'UI/UX Designer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff111827),
                            fontFamily: AppFonts.kLoginHeadlineFont,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'CV.pdf 300KB',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff6B7280),
                            fontFamily: AppFonts.kLoginSubHeadlineFont,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(AppImages.kEdit),
                    const SizedBox(width: 10),
                    Image.asset(AppImages.kCloseCircle)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
