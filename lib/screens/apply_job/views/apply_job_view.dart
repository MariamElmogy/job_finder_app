import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'package:dotted_line/dotted_line.dart';

import '../widgets/apply_job_form.dart';

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

class ApplyingProcess extends StatefulWidget {
  const ApplyingProcess({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepCompletionStatus,
  });

  final int currentStep;
  final int totalSteps;
  final List<bool> stepCompletionStatus;

  @override
  State<ApplyingProcess> createState() => _ApplyingProcessState();
}

class _ApplyingProcessState extends State<ApplyingProcess> {
  List<String> text = ['Biodata', 'Type of work', 'Upload portfolio'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.totalSteps,
        (index) => Row(
          children: [
            StepCircle(
              isDone: widget.stepCompletionStatus[index],
              number: index + 1,
              isActive: index + 1 == widget.currentStep,
              text: text[index],
            ),
            if (index != widget.totalSteps - 1)
              CustomDots(
                isActive: index + 1 == widget.currentStep,
              ),
          ],
        ),
      ),
    );
  }
}

class CustomDots extends StatelessWidget {
  const CustomDots({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: MediaQuery.of(context).size.width * 0.08,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: isActive ? const Color(0xff3366FF) : const Color(0xff9CA3AF),
        dashGapLength: 4.0,
        dashGapColor: Colors.white,
      ),
    );
  }
}

class StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  final bool isDone;
  final String text;

  const StepCircle({
    super.key,
    required this.number,
    required this.isActive,
    required this.isDone,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: isActive
              ? const Color(0xff3366FF)
              : isDone
                  ? const Color(0xff3366FF)
                  : const Color(0xff9CA3AF),
          child: CircleAvatar(
              radius: 22,
              foregroundColor: isActive
                  ? const Color(0xff3366FF)
                  : isDone
                      ? const Color(0xff3366FF)
                      : const Color(0xff9CA3AF),
              backgroundColor: isActive
                  ? Colors.white
                  : isDone
                      ? const Color(0xff3366FF)
                      : Colors.white,
              child: isDone
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(number.toString())),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isActive
                  ? const Color(0xff3366FF)
                  : isDone
                      ? const Color(0xff3366FF)
                      : const Color(0xff9CA3AF),
          ),
        ),
      ],
    );
  }
}
