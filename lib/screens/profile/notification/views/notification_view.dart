import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<String> title = [
    'Your Job Search Alert',
    'Job Application Update',
    'Job Application Reminders',
    'Jobs You May Be Interested In',
    'Job Seeker Updates',
  ];
  List<String> otherNotification = [
    'Show Profile',
    'All Message',
    'Message Nudges',
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
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xffE5E7EB),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              'Job notification',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: title.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: const CustomSwitch(),
                  // trailing: Switch(value: true, onChanged: (value) {}),
                  title: Text(
                    title[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: const Color(0xffE5E7EB),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              'Other notification',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherNotification.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: const CustomSwitch(),
                  title: Text(
                    otherNotification[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2),
      height: 26,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: toggleValue ? const Color(0xff3366FF) : const Color(0xffD1D5DB),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2),
            curve: Curves.easeIn,
            top: 1,
            left: toggleValue ? 22.0 : 0.0,
            right: toggleValue ? 0.0 : 22.0,
            child: GestureDetector(
              onTap: toggleButton,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 2),
                  child: toggleValue
                      ? CircleAvatar(
                          backgroundColor: const Color(0xffD6E4FF),
                          radius: 12.0,
                          key: UniqueKey(),
                        )
                      : CircleAvatar(
                          backgroundColor: const Color(0xffF4F4F5),
                          radius: 12.0,
                          key: UniqueKey(),
                        )),
            ),
          ),
        ],
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
