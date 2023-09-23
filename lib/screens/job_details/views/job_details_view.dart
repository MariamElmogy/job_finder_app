import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/apply_job/views/apply_job_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import '../widgets/company_detail.dart';
import '../widgets/job_description.dart';
import '../widgets/job_detail.dart';
import '../widgets/job_information.dart';
import '../widgets/people_applied.dart';

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({super.key, required this.job});

  final JobsModel job;

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  List<String> labels = ['Desicription', 'Company', 'People'];

  int counter = 0;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: JobInformation(job: widget.job),
            ),
            SliverToBoxAdapter(
              child: JobDetail(
                counter: counter,
                labels: labels,
                onToggle: (index) {
                  setState(
                    () {
                      counter = index!;
                    },
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: counter == 0
                  ? JobDescription(
                      job: widget.job,
                    )
                  : counter == 1
                      ? CompanyDetail(
                          job: widget.job,
                        )
                      : PeopleApplied(widget: widget),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CustomButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ApplyJobView();
                  },
                )),
            text: 'Apply now'),
      ),
    );
  }
}
