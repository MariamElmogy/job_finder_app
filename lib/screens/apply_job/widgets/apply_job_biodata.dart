import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/apply_job/widgets/apply_form_headline.dart';
import 'package:job_finder_app/screens/apply_job/widgets/apply_job_form.dart';

import '../../../utils/app_fonts.dart';
import 'applying_process.dart';

class ApplyJobBiodata extends StatefulWidget {
  const ApplyJobBiodata({
    super.key,
  });

  @override
  State<ApplyJobBiodata> createState() => _ApplyJobBiodataState();
}

class _ApplyJobBiodataState extends State<ApplyJobBiodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ApplyingProcess(
              stepCompletionStatus: [false, false, false],
              currentStep: 1,
              totalSteps: 3,
            ),
            SizedBox(height: 25),
            ApplyFormHeadline(
                headline: 'Biodata',
                subheadline: 'Fill in your bio data correctly'),
            ApplyJobForm(),
          ],
        ),
      ),
    );
  }
}
