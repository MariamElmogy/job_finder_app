import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.image,
    required this.isPasswordCorrect,
    this.onChanged,
    this.onSaved,
  });

  final String hintText;
  final String image;
  final bool isPasswordCorrect;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // 7- to see the focus on each textfield
  final FocusNode _textFieldFocusNode = FocusNode();
  bool isObscure = true;
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _textFieldFocusNode.removeListener(_handleFocusChange);
    _textFieldFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isTextFieldFocused = _textFieldFocusNode.hasFocus;
    });
  }

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // 1- the icon and the hint text
        // the text in the text field
        hintText: widget.hintText,
        // hint style
        hintStyle: const TextStyle(
          color: AppColors.kRegisterHints,
          fontSize: 14,
          fontFamily: AppFonts.kRegisterHintFont,
        ),
        prefixIcon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            (isTextFieldFocused || !widget.isPasswordCorrect)
                ? Colors.black
                : Colors.grey,
            BlendMode.modulate,
          ),
          child: Image.asset(widget.image),
        ),

        // 2- border color and radius
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: widget.isPasswordCorrect
                ? AppColors.kBoarderColor
                : widget.hintText == 'Password'
                    ? const Color(0xffFF472B)
                    : AppColors.kBorderFocusColor,
          ),
        ),

        // 3- the focus border
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: widget.hintText == 'Password'
                ? (widget.isPasswordCorrect
                    ? AppColors.kBorderFocusColor
                    : const Color(0xffFF472B))
                : AppColors.kBorderFocusColor,
          ),
        ),

        // 4- the error border
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color(0xffFF472B),
          ),
        ),

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),

        // 5- if the text field is for the password
        suffixIcon: widget.hintText == 'Password'
            ? IconButton(
                icon: isObscure
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: (isTextFieldFocused || !widget.isPasswordCorrect)
                            ? Colors.black
                            : Colors.grey,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: (isTextFieldFocused || !widget.isPasswordCorrect)
                            ? Colors.black
                            : Colors.grey,
                      ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),

      // 6- to check if I want the entered data to be shown
      // if the user reach to password text field then obscur the text
      obscureText: widget.hintText == 'Password' ? isObscure : !isObscure,

      // 8- initial the focus node
      focusNode: _textFieldFocusNode,

      // 9- the validation
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.hintText}';
        }
        if (widget.hintText == 'Email') {
          if (!_emailRegex.hasMatch(value)) {
            return 'Email address is not valid';
          }
        }

        return null;
      },
      onChanged: widget.onChanged,

      onSaved: widget.onSaved,
    );
  }
}

// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     required this.hintText,
//     required this.image,
//     this.controller,
//     this.onSaved,
//     required this.isPasswordCorrect,
//     this.onChanged,
//     required this.isEmailCorrect,
//     this.onFieldSubmitted,
//   });
//   final String hintText;
//   final String image;
//   final bool isPasswordCorrect;
//   final bool isEmailCorrect;
//   final void Function(String?)? onSaved;
//   final void Function(String)? onChanged;
//   final void Function(String)? onFieldSubmitted;
//   final TextEditingController? controller;

//   @override
//   State<CustomTextField> createState() =>
//       _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   final FocusNode _textFieldFocusNode = FocusNode();
//   bool isObscure = true;
//   bool isTextFieldFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _textFieldFocusNode.addListener(_handleFocusChange);
//   }

//   @override
//   void dispose() {
//     _textFieldFocusNode.removeListener(_handleFocusChange);
//     _textFieldFocusNode.dispose(); // Dispose the FocusNode
//     super.dispose();
//   }

//   void _handleFocusChange() {
//     setState(() {
//       isTextFieldFocused = _textFieldFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       //  " | " color
//       cursorColor: const Color(0xff3366FF),

//       // style of entered data
//       style: const TextStyle(
//         color: Color(0xff111827),
//         fontSize: 14,
//         fontFamily: AppFonts.kUserDataEnter,
//       ),

//       // validator
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your ${widget.hintText}';
//         }
//         if (widget.hintText == 'Email') {
//           if (widget.isEmailCorrect == false) {
//             return '@gmail.com';
//           } else {
//             return null;
//           }
//         }
//         return null;
//       },

//       // call the instance of the focus node
//       focusNode: _textFieldFocusNode,

//       // this used only for the password text field
//       obscureText: widget.hintText == 'Password' ? isObscure : false,

//       // controller to check if all fields are not empty
//       // controller: widget.controller,

//       // to save the input data
//       onSaved: widget.onSaved,

//       // on edit
//       onEditingComplete: () {
//         setState(() {
//           _textFieldFocusNode.unfocus();
//         });
//       },
//       onFieldSubmitted: widget.onFieldSubmitted,

//       // the decoration of the text field
//       decoration: InputDecoration(
//         // the text inside the text field
//         // the text will be added from the register form widget
//         hintText: widget.hintText,
//         // hint style
//         hintStyle: const TextStyle(
//           color: AppColors.kRegisterHints,
//           fontSize: 14,
//           fontFamily: AppFonts.kRegisterHintFont,
//         ),

//         // the Icon on the left in the text field
//         // the image will be called from the register form widget
//         // I will use the focus to check if the user is clicking on the widget
//         // then the color of the image changes
//         prefixIcon: ColorFiltered(
//           colorFilter: ColorFilter.mode(
//             (isTextFieldFocused || widget.isPasswordCorrect == false)
//                 ? Colors.black
//                 : Colors.grey,
//             BlendMode.modulate,
//           ),
//           child: Image.asset(widget.image),
//         ),

//         // this is used only for the password that show the eye icon
//         // to be able to show the password
//         // here I check if the hint text is for the password then show the icon
//         // else dont show it
//         suffixIcon: widget.hintText == 'Password'
//             ? _textFieldFocusNode.hasPrimaryFocus
//                 ? (IconButton(
//                     icon: isObscure
//                         ? const Icon(
//                             Icons.visibility_off_outlined,
//                             color: Colors.black,
//                           )
//                         : const Icon(
//                             Icons.visibility_outlined,
//                             color: Colors.black,
//                           ),
//                     onPressed: () {
//                       setState(() {
//                         isObscure = !isObscure;
//                       });
//                     }))
//                 : (IconButton(
//                     icon: isObscure
//                         ? const Icon(Icons.visibility_off_outlined)
//                         : const Icon(Icons.visibility_outlined),
//                     onPressed: () {
//                       setState(() {
//                         isObscure = !isObscure;
//                       });
//                     }))
//             : null,

//         // enable border
//         // here means that this is the default color of the border
//         enabledBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(
//             color: (widget.isPasswordCorrect
//                 ? AppColors.kBoarderColor
//                 : (widget.hintText == 'Password')
//                     ? const Color(0xffFF472B)
//                     : AppColors.kBorderFocusColor),
//           ),
//         ),

//         // focus color
//         // here means when the user click on the text field it will show
//         // the blue color of the focus
//         focusedBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(
//             color: widget.hintText == 'Password'
//                 ? (widget.isPasswordCorrect
//                     ? AppColors.kBorderFocusColor
//                     : const Color(0xffFF472B))
//                 : AppColors.kBorderFocusColor,
//           ),
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(
//             color: Color(0xffFF472B),
//           ),
//         ),
//       ),

//       // on changed
//       onChanged: widget.onChanged,
//     );
//   }
// }

// /*
//  common instances that can be used for the 3 text fields are:
//  * image -> can be called from the register form
//  * hint text -> can be called from the register form
//  * controller -> 34an a2dr ashof l text field status
// */
