import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../widgets/apply_job_biodata.dart';

class ApplyJobView extends StatefulWidget {
  const ApplyJobView({super.key});

  @override
  State<ApplyJobView> createState() => _ApplyJobViewState();
}

class _ApplyJobViewState extends State<ApplyJobView> {
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ApplyJobBiodata(),
      ),
    );
  }
}
