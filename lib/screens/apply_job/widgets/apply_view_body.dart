import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:job_finder_app/screens/apply_job/widgets/apply_form_headline.dart';
import 'package:job_finder_app/screens/apply_job/widgets/apply_job_form.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../services/job_api_service.dart';
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
        // SliverToBoxAdapter(
        //   child: ApplyingProcess(
        //     stepCompletionStatus: stepCompletionStatus,
        //     currentStep: currentStep,
        //     totalSteps: totalSteps,
        //   ),
        // ),

        SliverToBoxAdapter(
          child: ApplyJobBiodata(
            stepCompletionStatus: stepCompletionStatus,
            currentStep: currentStep,
            totalSteps: totalSteps,
            onNextStep: () {
              setState(() {
                currentStep++;
              });
            },
          ),
        ),

        SliverToBoxAdapter(
          child: CustomButton(
              onPressed: () {
                try {
                  JobApiService.applyJob(jobs);
                  stepCompletionStatus[currentStep - 1] = true;

                  if (currentStep < totalSteps) {
                    setState(() {
                      // onNextStep();
                      currentStep++;
                    });
                  }
                } catch (error) {
                  print('API request failed: $error');
                  stepCompletionStatus[currentStep - 1] = false;
                }
              },
              text: currentStep < totalSteps ? 'Next' : 'Submit'),
        ),
      ],
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     ApplyingProcess(
    //       stepCompletionStatus: stepCompletionStatus,
    //       currentStep: currentStep,
    //       totalSteps: totalSteps,
    //     ),
    //     const SizedBox(height: 20),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: currentStep == 1
    //           ? [
    //               const Padding(
    //                 padding: EdgeInsets.only(top: 8, bottom: 5),
    //                 child: Text(
    //                   'Biodata',
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     color: AppColors.kLoginHeadlines,
    //                     fontFamily: AppFonts.kLoginHeadlineFont,
    //                   ),
    //                 ),
    //               ),
    //               const Padding(
    //                 padding: EdgeInsets.only(bottom: 8),
    //                 child: Text(
    //                   'Fill in your bio data correctly',
    //                   style: TextStyle(
    //                     color: Color(0xff6B7280),
    //                     fontSize: 14,
    //                     fontFamily: AppFonts.kLoginSubHeadlineFont,
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 10),
    //               ApplyJobForm(
    //                 stepCompletionStatus: stepCompletionStatus,
    //                 currentStep: currentStep,
    //                 totalSteps: totalSteps,
    //                 onNextStep: () {
    //                   setState(() {
    //                     currentStep++; // Update currentStep here
    //                   });
    //                 },
    //               )
    //             ]
    //           : currentStep == 2
    //               ? [
    //                   const Padding(
    //                     padding: EdgeInsets.only(top: 8, bottom: 5),
    //                     child: Text(
    //                       'Type of work',
    //                       style: TextStyle(
    //                         fontSize: 20,
    //                         color: AppColors.kLoginHeadlines,
    //                         fontFamily: AppFonts.kLoginHeadlineFont,
    //                       ),
    //                     ),
    //                   ),
    //                   const Padding(
    //                     padding: EdgeInsets.only(bottom: 8),
    //                     child: Text(
    //                       'Fill in your bio data correctly',
    //                       style: TextStyle(
    //                         color: Color(0xff6B7280),
    //                         fontSize: 14,
    //                         fontFamily: AppFonts.kLoginSubHeadlineFont,
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 20),
    //                   SingleChildScrollView(
    //                     child: Column(
    //                       children: const [
    //                         TypeOfWorkChoices(),
    //                        ],
    //                     ),
    //                   ),
    //                   CustomButton(
    //                       onPressed: () {
    //                         try {
    //                           // jobs.work_type;
    //                           JobApiService.applyJob(jobs);

    //                           stepCompletionStatus[currentStep - 1] = true;

    //                           if (currentStep < totalSteps) {
    //                             setState(() {
    //                               currentStep++;
    //                             });
    //                           }
    //                         } catch (error) {
    //                           print('API request failed: $error');
    //                           stepCompletionStatus[currentStep - 1] = false;
    //                         }
    //                       },
    //                       text: currentStep < totalSteps ? 'Next' : 'Submit'),
    //                 ]
    //               : currentStep == 3
    //                   ? [
    //                       const Padding(
    //                         padding: EdgeInsets.only(top: 8, bottom: 5),
    //                         child: Text(
    //                           'Upload portfolio',
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             color: AppColors.kLoginHeadlines,
    //                             fontFamily: AppFonts.kLoginHeadlineFont,
    //                           ),
    //                         ),
    //                       ),
    //                       const Padding(
    //                         padding: EdgeInsets.only(bottom: 8),
    //                         child: Text(
    //                           'Fill in your bio data correctly',
    //                           style: TextStyle(
    //                             color: Color(0xff6B7280),
    //                             fontSize: 14,
    //                             fontFamily: AppFonts.kLoginSubHeadlineFont,
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 20),
    //                       const ApplyFormTitle(title: 'Upload CV'),
    // CustomButton(
    //     onPressed: () {
    //       try {
    //         JobApiService.applyJob(jobs);
    //         stepCompletionStatus[currentStep - 1] = true;

    //         if (currentStep < totalSteps) {
    //           setState(() {
    //             // onNextStep();
    //             currentStep++;
    //           });
    //         }
    //       } catch (error) {
    //         print('API request failed: $error');
    //         stepCompletionStatus[currentStep - 1] = false;
    //       }
    //     },
    //     text:
    //         currentStep < totalSteps ? 'Next' : 'Submit'),
    //                     ]
    //                   : [],
    //     ),
    //   ],
    // );
  }
}

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
        ApplyingProcess(
          stepCompletionStatus: widget.stepCompletionStatus,
          currentStep: widget.currentStep,
          totalSteps: widget.totalSteps,
        ),
        const SizedBox(height: 25),
        const ApplyFormHeadline(
            headline: 'Biodata',
            subheadline: 'Fill in your bio data correctly'),
        const ApplyJobForm(
            // currentStep: widget.currentStep,
            // totalSteps: widget.totalSteps,
            // onNextStep: widget.onNextStep,
            // stepCompletionStatus: widget.stepCompletionStatus
            )
      ],
    );
  }
}
