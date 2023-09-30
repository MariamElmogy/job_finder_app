import 'package:flutter/material.dart';

import '../../../models/apply_job_model.dart';

class SuccessfulApplyingItem extends StatelessWidget {
  const SuccessfulApplyingItem({super.key, required this.job});
  final ApplyJobsModel job;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: Text(job.name.toString()),
          ),
        )
        // ),
        );
  }
}
