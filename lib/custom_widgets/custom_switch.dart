

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
