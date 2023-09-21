import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job_list_view.dart';
import 'package:job_finder_app/services/job_api_service.dart';

class RecentJobViewFutureBuilder extends StatelessWidget {
  const RecentJobViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JobApiService.fetchAllJobsData(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecentJobListView(jobsModel: snapshot.data!);
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
