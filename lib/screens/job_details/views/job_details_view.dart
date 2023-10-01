import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/apply_job/views/apply_job_view.dart';
import 'package:job_finder_app/screens/job_details/widgets/job_details_view_body.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.job});

  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Job Detail',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Image.asset(AppImages.kArchive),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: JobDetailsViewBody(job: job),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CustomButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplyJobView(jobId: job.id!),
                  ));
            },
            text: 'Apply now'),
      ),
    );
  }
}
