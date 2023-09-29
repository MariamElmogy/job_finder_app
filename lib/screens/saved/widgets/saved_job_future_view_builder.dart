import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_list_view.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class SavedJobViewFutureBuilder extends StatelessWidget {
  const SavedJobViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoritesApiService.fetchAllFavoritesJobs(),
      builder: (context, snapshot) {
        if ((snapshot.data?.isEmpty ?? true)) {
          return const SingleChildScrollView(child: NoSavedJobs());
        }
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: const Color(0xffE5E7EB),
                  child: Text(
                    '${snapshot.data!.length} Job Saved',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff6B7280),
                      fontSize: 14,
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SavedListView(jobsModel: snapshot.data!),
              ],
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

class NoSavedJobs extends StatelessWidget {
  const NoSavedJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(AppImages.kSavedIlustration),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nothing has been saved yet',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.kRegisterHeadlineFont,
                  color: Color(0xff111827)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Press the star icon on the job you want to save.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontFamily: AppFonts.kRegisterHintFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
