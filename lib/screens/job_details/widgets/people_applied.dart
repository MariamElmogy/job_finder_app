
import 'package:flutter/cupertino.dart';

import '../../job_details/views/job_details_view.dart';

class PeopleApplied extends StatelessWidget {
  const PeopleApplied({
    super.key,
    required this.widget,
  });

  final JobDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text('${widget.job.favorites} Employees For'),
        Text(widget.job.job_description ?? ''),
        const SizedBox(height: 20),
        const Text('Skill Required'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(widget.job.job_skill ?? ''),
        ),
      ],
    );
  }
}
