import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class LoginAndSecurityView extends StatefulWidget {
  const LoginAndSecurityView({super.key});

  @override
  State<LoginAndSecurityView> createState() => _LoginAndSecurityViewState();
}

class _LoginAndSecurityViewState extends State<LoginAndSecurityView> {
  List<String> title = [
    'Email address',
    'Phone number',
    'Change password',
    'Two-step verification',
    'Face ID',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Login and security',
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
              'Accont access',
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
                  trailing: const Icon(Icons.arrow_forward),
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
        ],
      ),
    );
  }
}
