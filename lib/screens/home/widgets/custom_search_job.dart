import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class CustomSearchJob extends StatelessWidget {
  const CustomSearchJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return const CustomSearchJob();
              //   },
              // ));
            },
          ),
          hintText: 'Search....',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.kRegisterHints,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
