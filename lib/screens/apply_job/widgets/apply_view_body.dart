import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';

import 'apply_job_biodata.dart';
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
  
    return const ApplyJobBiodata();
  }
}
