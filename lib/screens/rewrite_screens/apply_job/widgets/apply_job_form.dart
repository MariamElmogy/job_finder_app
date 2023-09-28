import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:job_finder_app/screens/rewrite_screens/apply_job/widgets/phone_text_field.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../../../../services/job_api_service.dart';
import '../../../../utils/app_images.dart';
import 'apply_form_title.dart';

class ApplyJobForm extends StatefulWidget {
  const ApplyJobForm({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onNextStep,
    required this.stepCompletionStatus,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback onNextStep; // Define the callback function type
  final List<bool> stepCompletionStatus;

  @override
  State<ApplyJobForm> createState() => _ApplyJobFormState();
}

class _ApplyJobFormState extends State<ApplyJobForm> {
//
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  ApplyJobsModel applyJobs = ApplyJobsModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ApplyFormTitle(title: 'Full Name'),
          CustomTextField(
            hintText: 'Full Name',
            image: AppImages.kProfile,
            isPasswordCorrect: true,
            onSaved: (value) {
              applyJobs.name = value!.trim();
            },
          ),

          // email textfield
          const ApplyFormTitle(title: 'Email'),
          CustomTextField(
            hintText: 'Email',
            image: AppImages.kEmail,
            isPasswordCorrect: true,
            onSaved: (value) {
              applyJobs.email = value!.trim();
            },
          ),

          const ApplyFormTitle(
            title: 'No.Handphone',
          ),

          PhoneTextField(
            autovalidateMode: autovalidateMode,
            onSaved: (value) {
              applyJobs.mobile = value!.number.toString().trim();
            },
          ),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  try {
                    JobApiService.applyJob(applyJobs, {
                      'name': applyJobs.name,
                      'email': applyJobs.email,
                      'mobile': applyJobs.mobile,
                    });
                    widget.stepCompletionStatus[widget.currentStep - 1] = true;

                    if (widget.currentStep < widget.totalSteps) {
                      setState(() {
                        widget.onNextStep();
                      });
                    }
                  } catch (error) {
                    print('API request failed: $error');
                    widget.stepCompletionStatus[widget.currentStep - 1] = false;
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: widget.currentStep < widget.totalSteps ? 'Next' : 'Submit'),
        ],
      ),
    );
  }
}
