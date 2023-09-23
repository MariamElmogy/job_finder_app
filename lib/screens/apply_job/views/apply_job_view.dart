import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

import '../widgets/apply_job_form.dart';
import '../widgets/applying_process.dart';

class ApplyJobView extends StatefulWidget {
  const ApplyJobView({super.key});

  @override
  State<ApplyJobView> createState() => _ApplyJobViewState();
}

class _ApplyJobViewState extends State<ApplyJobView> {
  int currentStep = 1;
  int totalSteps = 3;
  List<bool> stepCompletionStatus = [false, false, false];

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Apply Job',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                        // setState(() {
                        stepCompletionStatus[currentStep - 1] = true;
                        // });

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
            ),
          ),
        ),
      ),
    );
  }
}
