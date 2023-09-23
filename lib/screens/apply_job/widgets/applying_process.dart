import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/screens/apply_job/widgets/stap_circle.dart';

import 'custom_dots.dart';

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
