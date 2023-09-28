import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';

import '../../../../custom_widgets/custom_button.dart';
import 'applying_process.dart';

class ApplyJobViewBody extends StatefulWidget {
  const ApplyJobViewBody({super.key});

  @override
  State<ApplyJobViewBody> createState() => _ApplyJobViewBodyState();
}

class _ApplyJobViewBodyState extends State<ApplyJobViewBody> {
  int currentStep = 1;
  int totalSteps = 3;
  List<bool> stepCompletionStatus = [false, false, false];
  ApplyJobsModel jobs = ApplyJobsModel();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ApplyingProcess(
            stepCompletionStatus: stepCompletionStatus,
            currentStep: currentStep,
            totalSteps: totalSteps,
          ),
        ),

        SliverToBoxAdapter(
          child: CustomButton(
            onPressed: () {
              try {
                stepCompletionStatus[currentStep - 1] = true;

                if (currentStep < totalSteps) {
                  setState(() {
                    currentStep++;
                  });
                }
              } catch (error) {
                print('API request failed: $error');
                stepCompletionStatus[currentStep - 1] = false;
              }
            },
            text: currentStep < totalSteps ? 'Next' : 'Submit',
          ),
        ),
        // SliverToBoxAdapter(
        //   child: currentStep == 1
        //       ? ApplyJobBiodata(
        //           stepCompletionStatus: stepCompletionStatus,
        //           currentStep: currentStep,
        //           totalSteps: totalSteps,
        //           onNextStep: () {
        //             setState(() {
        //               currentStep++;
        //             });
        //           },
        //         )
        //       : currentStep == 2
        //           ? ApplyJobTypeOfWork(
        //               stepCompletionStatus: stepCompletionStatus,
        //               currentStep: currentStep,
        //               totalSteps: totalSteps,
        //               onNextStep: () {
        //                 setState(() {
        //                   currentStep++;
        //                 });
        //               },
        //             )
        //           : currentStep == 3
        //               ? const ApplyJobUploadPortfolio()
        //               : Container(),
        // ),
      ],
    );
  }
}
