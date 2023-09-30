import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job.dart';
import 'package:job_finder_app/services/job_api_service.dart';

import '../../job_details/views/job_details_view.dart';

class SuggestJobViewFutureBuilder extends StatelessWidget {
  const SuggestJobViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JobApiService.fetchSuggestedJobsData(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return JobDetailsView(
                        job: snapshot.data!,
                      );
                    },
                  ),
                );
              },
              child: SuggestJob(job: snapshot.data!),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return Text(
            snapshot.error.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
