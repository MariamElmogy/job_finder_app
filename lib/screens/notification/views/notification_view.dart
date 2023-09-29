import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../utils/app_fonts.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  List<String> title = ['Dana', 'Shoope', 'Slack', 'Facebook'];
  List<String> image = [
    AppImages.kDanaLogo,
    AppImages.kShoopeLogo,
    AppImages.kSlackLogo,
    AppImages.kFacebookLogoLarger,
  ];
  List<String> notify = [
    'Email setup successful',
    'Welcome to Jobsque',
  ];
  List<String> content = [
    'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
    'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
  ];

  List<String> icon = [
    AppImages.kEmail,
    AppImages.kSearch,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffF4F4F5),
                ),
                color: const Color(0xffE5E7EB),
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text(
                'New',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
            ),
            SizedBox(
              child: ListView.separated(
                itemCount: title.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(image[index]),
                    title: Text(
                      title[index],
                      style: const TextStyle(
                        color: Color(0xff111827),
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                    subtitle: const Text(
                      'Posted new design jobs',
                      style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                    trailing: const Text(
                      '10.00AM',
                      style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffF4F4F5),
                ),
                color: const Color(0xffE5E7EB),
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text(
                'New',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
            ),
            SizedBox(
              child: ListView.separated(
                itemCount: icon.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(icon[index]),
                    title: Text(
                      notify[index],
                      style: const TextStyle(
                        color: Color(0xff111827),
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                    subtitle: Text(
                      content[index],
                      style: const TextStyle(
                        color: Color(0xff4B5563),
                        fontSize: 12,
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                    trailing: const Text(
                      '10.00AM',
                      style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
