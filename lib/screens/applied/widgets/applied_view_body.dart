import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../job_details/widgets/job_detail.dart';

class AppliedViewBody extends StatefulWidget {
  const AppliedViewBody({super.key});

  @override
  State<AppliedViewBody> createState() => _AppliedViewBodyState();
}

class _AppliedViewBodyState extends State<AppliedViewBody> {
  List<String> labels = ['Activate', 'Rejected'];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: JobDetail(
            minWidth: 180.0,
            counter: counter,
            labels: labels,
            onToggle: (index) {
              setState(
                () {
                  counter = index!;
                },
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffE5E7EB),
              ),
              color: const Color(0xffF4F4F5),
            ),
            child: const Text(
              '3 Jobs',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
