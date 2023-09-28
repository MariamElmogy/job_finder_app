import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_single_information.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ProfileSingleInformation(title: 'Applied', numbers: '46'),
              VerticalDivider(thickness: 2),
              ProfileSingleInformation(title: 'Reviewed', numbers: '23'),
              VerticalDivider(thickness: 2),
              ProfileSingleInformation(title: 'Contacted', numbers: '16'),
            ],
          ),
        ),
      ),
    );
  }
}
