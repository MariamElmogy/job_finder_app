import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/apply_job/widgets/phone_text_field.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../utils/app_images.dart';
import 'apply_form_title.dart';
import 'apply_job_type_of_work.dart';

class ApplyJobForm extends StatefulWidget {
  const ApplyJobForm({
    super.key,
  });

  @override
  State<ApplyJobForm> createState() => _ApplyJobFormState();
}

class _ApplyJobFormState extends State<ApplyJobForm> {
//
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // ApplyJobsModel applyJobs = ApplyJobsModel();
  String name = '';
  String email = '';
  String phone = '';
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
              name = value!.trim();
            },
          ),

          // email textfield
          const ApplyFormTitle(title: 'Email'),
          CustomTextField(
            hintText: 'Email',
            image: AppImages.kEmail,
            isPasswordCorrect: true,
            onSaved: (value) {
              email = value!.trim();
            },
          ),

          const ApplyFormTitle(
            title: 'No.Handphone',
          ),

          PhoneTextField(
            autovalidateMode: autovalidateMode,
            onSaved: (value) {
              phone = value!.number.toString().trim();
            },
          ),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  try {
                    // JobApiService.applyJob(applyJobs, {
                    //   'name': applyJobs.name,
                    //   'email': applyJobs.email,
                    //   'mobile': applyJobs.mobile,
                    // });

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ApplyJobTypeOfWork(
                          email: email,
                          name: name,
                          phone: phone,
                        );
                      },
                    ));
                  } catch (error) {
                    print('API request failed: $error');
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: 'Next'),
        ],
      ),
    );
  }
}
