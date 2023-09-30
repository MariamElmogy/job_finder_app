import 'package:flutter/material.dart';

import '../../../models/apply_job_model.dart';

class SuccessfulApplyingItem extends StatelessWidget {
  const SuccessfulApplyingItem({super.key, required this.job});
  final ApplyJobsModel job;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffD6E4FF),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.work_type.toString(),
              ),
              const Text(
                'Waiting to be selected by the twitter team',
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
