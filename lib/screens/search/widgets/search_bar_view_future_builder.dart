// _displayContainer
//                   ? display_list.isNotEmpty
//                       ? Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   GestureDetector(
//                                     child: Image.asset(AppImages.kFilter),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       : Center(
//                           child: Column(
//                             children: [
//                               Image.asset(AppImages.kSearchIlustration),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               const Text(
//                                 'Search not found',
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontFamily: AppFonts.kRegisterHeadlineFont,
//                                   color: Color(0xff111827),
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16),
//                                 child: Text(
//                                   'Try searching with different keywords so\n we can show you',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Color(0xff6B7280),
//                                     fontFamily: AppFonts.kRegisterHintFont,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                   : Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffF4F4F5),
//                             border: Border.all(color: const Color(0xffE5E7EB)),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Text(
//                               'Recent searches',
//                               style: TextStyle(
//                                 color: Color(0xff6B7280),
//                                 fontFamily: AppFonts.kLoginHeadlineFont,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           itemCount: display_list.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(
//                                 right: 20.0,
//                                 left: 20.0,
//                                 bottom: 8.0,
//                               ),
//                               child: Row(
//                                 children: [
//                                   ColorFiltered(
//                                     colorFilter: const ColorFilter.mode(
//                                       Colors.black,
//                                       BlendMode.modulate,
//                                     ),
//                                     child: Image.asset(AppImages.kClock),
//                                   ),
//                                   const SizedBox(width: 15),
//                                   Text(
//                                     display_list[index].comp_name.toString(),
//                                     style: const TextStyle(
//                                       color: Color(0xff111827),
//                                       fontSize: 14,
//                                       fontFamily:
//                                           AppFonts.kLoginSubHeadlineFont,
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         display_list.removeAt(index);
//                                       });
//                                     },
//                                     child: Image.asset(
//                                       AppImages.kCloseCircle,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffF4F4F5),
//                             border: Border.all(color: const Color(0xffE5E7EB)),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Text(
//                               'Recent searches',
//                               style: TextStyle(
//                                 color: Color(0xff6B7280),
//                                 fontFamily: AppFonts.kLoginHeadlineFont,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),