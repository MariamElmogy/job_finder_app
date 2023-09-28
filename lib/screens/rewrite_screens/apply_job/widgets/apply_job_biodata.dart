import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/rewrite_screens/apply_job/widgets/apply_form_headline.dart';
import 'package:job_finder_app/screens/rewrite_screens/apply_job/widgets/apply_job_form.dart';

class ApplyJobBiodata extends StatefulWidget {
  const ApplyJobBiodata(
      {super.key,
      required this.stepCompletionStatus,
      required this.currentStep,
      required this.totalSteps,
      required this.onNextStep});

  final List<bool> stepCompletionStatus;
  final int currentStep;
  final int totalSteps;
  final void Function() onNextStep;
  @override
  State<ApplyJobBiodata> createState() => _ApplyJobBiodataState();
}

class _ApplyJobBiodataState extends State<ApplyJobBiodata> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ApplyingProcess(
        //   stepCompletionStatus: widget.stepCompletionStatus,
        //   currentStep: widget.currentStep,
        //   totalSteps: widget.totalSteps,
        // ),
        const SizedBox(height: 25),
        const ApplyFormHeadline(
            headline: 'Biodata',
            subheadline: 'Fill in your bio data correctly'),
        
        ApplyJobForm(
          currentStep: widget.currentStep,
          totalSteps: widget.totalSteps,
          onNextStep: widget.onNextStep,
          stepCompletionStatus: widget.stepCompletionStatus,
        )
      ],
    );
  }
}
