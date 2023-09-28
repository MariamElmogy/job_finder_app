import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:job_finder_app/screens/rewrite_screens/apply_job/widgets/type_of_work_choices.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../services/job_api_service.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class ApplyJobTypeOfWork extends StatefulWidget {
  const ApplyJobTypeOfWork(
      {super.key,
      required this.stepCompletionStatus,
      required this.currentStep,
      required this.totalSteps,
      required this.onNextStep});

  final int currentStep;
  final int totalSteps;
  final VoidCallback onNextStep; // Define the callback function type
  final List<bool> stepCompletionStatus;

  @override
  State<ApplyJobTypeOfWork> createState() => ApplyJobTypeOfWorkState();
}

class ApplyJobTypeOfWorkState extends State<ApplyJobTypeOfWork> {
  ApplyJobsModel applyJobs = ApplyJobsModel();
  String selectedWorkType = ''; // Store the selected work type
  void handleWorkTypeSelected(String workType) {
    setState(() {
      selectedWorkType = workType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 5),
          child: Text(
            'Type of work',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.kLoginHeadlines,
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Fill in your bio data correctly',
            style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 14,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TypeOfWorkChoices(onWorkTypeSelected: handleWorkTypeSelected),
        CustomButton(
            onPressed: () {
              if (selectedWorkType.isNotEmpty) {
                try {
                  applyJobs.work_type = selectedWorkType;
                  JobApiService.applyJob(
                    applyJobs,
                    {
                      'work_type': applyJobs.work_type,
                    },
                  );

                  widget.stepCompletionStatus[widget.currentStep - 1] = true;

                  if (widget.currentStep < widget.totalSteps) {
                    setState(() {
                      widget.onNextStep;
                    });
                  }
                } catch (error) {
                  print('API request failed: $error');
                  widget.stepCompletionStatus[widget.currentStep - 1] = false;
                }
              }
            },
            text: widget.currentStep < widget.totalSteps ? 'Next' : 'Submit'),
      ],
    );
  }
}
