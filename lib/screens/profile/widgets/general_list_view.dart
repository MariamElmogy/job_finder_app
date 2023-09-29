import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/widgets/portfolio_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../edit_profile/views/edit_profile_view.dart';
import '../languages/views/language_view.dart';
import '../login_and_security/views/login_and_security_view.dart';
import '../notification/views/notification_view.dart';

class GeneralListView extends StatefulWidget {
  const GeneralListView({
    super.key,
  });

  @override
  State<GeneralListView> createState() => _GeneralListViewState();
}

class _GeneralListViewState extends State<GeneralListView> {
  List<String> general = [
    'Edit Profile',
    'Portfolio',
    'Language',
    'Notification',
    'Login and security'
  ];
  List<String> generalImage = [
    AppImages.kProfile,
    AppImages.kPortfolio,
    AppImages.kGlobalIcon,
    AppImages.kNotificationIcon,
    AppImages.kPassword,
  ];

  List<dynamic> screen = [
    const EditProfileView(),
    const PortfolioView(),
    const LanguageView(),
    const NotificationView(),
    const LoginAndSecurityView()
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        itemCount: general.length,
        shrinkWrap: true, // Set shrinkWrap to true
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return screen[index];
                },
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            leading: CircleAvatar(
              backgroundColor: const Color(0xffD6E4FF),
              child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      AppColors.kBorderFocusColor, BlendMode.modulate),
                  child: Image.asset(generalImage[index])),
            ),
            title: Text(
              general[index],
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff111827),
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
    );
  }
}