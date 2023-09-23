import 'package:flutter/cupertino.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'apply_job_form.dart';
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

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApplyingProcess(
          stepCompletionStatus: stepCompletionStatus,
          currentStep: currentStep,
          totalSteps: totalSteps,
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 5),
          child: Text(
            'Biodata',
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
        const SizedBox(height: 10),
        ApplyJobForm(
          autovalidateMode: autovalidateMode,
          formkey: _formKey,
        ),
        CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                stepCompletionStatus[currentStep - 1] = true;

                if (currentStep < totalSteps) {
                  setState(() {
                    currentStep++;
                  });
                }
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            text: currentStep < totalSteps ? 'Next' : 'Submit'),
      ],
    );
  }
}
