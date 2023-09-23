import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/apply_job/widgets/phone_text_field.dart';

import '../../../custom_widgets/custom_textfield.dart';
import '../../../utils/app_images.dart';
import 'apply_form_title.dart';

class ApplyJobForm extends StatefulWidget {
  const ApplyJobForm({
    super.key,
    required this.formkey,
    required this.autovalidateMode,
  });
  final Key formkey;
  final AutovalidateMode autovalidateMode;
  @override
  State<ApplyJobForm> createState() => _ApplyJobFormState();
}

class _ApplyJobFormState extends State<ApplyJobForm> {
  // final _formKey = GlobalKey<FormState>();
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, fullName, phone;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      autovalidateMode: widget.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ApplyFormTitle(title: 'Full Name'),
          CustomTextField(
            hintText: 'Full Name',
            image: AppImages.kProfile,
            isPasswordCorrect: true,
            onSaved: (value) {
              fullName = value!.trim();
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

          // CustomTextField(
          //   hintText: 'No.Handphone',
          //   image: AppImages.kUSAflag,
          //   isPasswordCorrect: true,
          //   onSaved: (value) {
          //     phone = value!.trim();
          //   },
          // ),
          PhoneTextField(widget: widget)

          // CustomButton(
          //     onPressed: () async {
          //       if (_formKey.currentState!.validate()) {
          //         _formKey.currentState?.save();
          //       } else {
          //         setState(() {
          //           autovalidateMode = AutovalidateMode.always;
          //         });
          //       }
          //     },
          //     text: 'Next'),
        ],
      ),
    );
  }
}
