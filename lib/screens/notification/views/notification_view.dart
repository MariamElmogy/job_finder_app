import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../utils/app_fonts.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key, required this.notificationStatus});

  final bool notificationStatus;

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
    AppImages.kEmailColored,
    AppImages.kSearchStatusColored,
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
      body: notificationStatus
          ? Column(
              children: [
                const CustomContainerNotification(title: 'New'),
                SizedBox(
                  child: ListView.separated(
                    itemCount: title.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomNewPostedNotification(
                        image: image[index],
                        title: title[index],
                        content: 'Posted new design jobs',
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
                const CustomContainerNotification(title: 'Yesterday'),
                SizedBox(
                  child: ListView.separated(
                    itemCount: icon.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomOldPostedNotification(
                        image: icon[index],
                        title: notify[index],
                        content: content[index],
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
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.NotificationIlustration),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'No new notifications yet',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.kRegisterHeadlineFont,
                      color: Color(0xff111827),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'You will receive a notification if there is something on your account',
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

class CustomNewPostedNotification extends StatelessWidget {
  const CustomNewPostedNotification({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff111827),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Color(0xffDBB40E),
            radius: 4,
          ),
          const SizedBox(width: 8),
          const Text(
            '10.00AM',
            style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 12,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOldPostedNotification extends StatelessWidget {
  const CustomOldPostedNotification({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: const Color(0xffD6E4FF),
              child: Image.asset(image)),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff111827),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Color(0xffDBB40E),
            radius: 4,
          ),
          const SizedBox(width: 8),
          const Text(
            '10.00AM',
            style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 12,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainerNotification extends StatelessWidget {
  const CustomContainerNotification({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffF4F4F5),
        ),
        color: const Color(0xffE5E7EB),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff6B7280),
          fontSize: 14,
          fontFamily: AppFonts.kLoginHeadlineFont,
        ),
      ),
    );
  }
}
