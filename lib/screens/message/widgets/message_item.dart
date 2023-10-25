import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/models/message_model.dart';
import 'package:job_finder_app/screens/message/widgets/message_bubble.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_message_bubble.dart';

class MessageItem extends StatefulWidget {
  const MessageItem(
      {super.key,
      required this.title,
      required this.image,
      required this.company});

  final String title;
  final String image;
  final String company;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  late TextEditingController textEditingController;
  late ScrollController scrollController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    _retrieveUserId();
    // _messagesStream = FirebaseFirestore.instance
    //     .collection(kMessagesCollections)
    //     .where('comp_name', isEqualTo: widget.company)
    //     .orderBy('timeStamp', descending: true)
    //     .snapshots();
    super.initState();
  }

  int? userId;

  final CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  @override
  void dispose() {
    textEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _retrieveUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getInt(kUserId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return const MessageView();
                        //     },
                        //   ),
                        // ),
                        Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(widget.image),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xff111827),
                      fontFamily: AppFonts.kLoginHeadlineFont,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(AppImages.kMore)
                ],
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _messagesCollection
                      .doc(widget.company)
                      .collection(kMessagesCollections)
                      .orderBy('timeStamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    log('rebuild');

                    List<MessageModel> messages = [];
                    if (snapshot.hasData) {
                      for (var document in snapshot.data!.docs) {
                        messages.add(MessageModel.fromJson(
                            document.data() as Map<String, dynamic>));
                      }
                    }
                    return ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return getMessageBubble(messages[index], userId);
                      },
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (data) async {
                        // String uid = FirebaseAuth.instance.currentUser!.uid;
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        textEditingController.clear();
                        scrollController.animateTo(0,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn);
                        MessageModel messageModel = MessageModel(
                          massage: data,
                          user_id: preferences.getInt(kUserId),
                          timeStamp: Timestamp.now(),
                          comp_name: widget.company,
                          // comp_id: widget.company_id,
                        );

                        sendMessage(messageModel);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        suffixIcon: const Icon(Icons.send),
                        hintText: 'Write a message...',
                        hintStyle: const TextStyle(
                          color: Color(0xff9CA3AF),
                          fontSize: 14,
                          fontFamily: AppFonts.kLoginSubHeadlineFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMessageBubble(MessageModel message, int? userId) {
    if (message.user_id == userId) {
      log('inside condition');
      return MyMessageBubble(messageModel: message);
    } else {
      return MessageBubble(messageModel: message);
    }
  }

  Future<void> sendMessage(MessageModel message) async {
    CollectionReference companyMessages = _messagesCollection
        .doc(widget.company)
        .collection(kMessagesCollections);

    await companyMessages.add(message.toJson());
  }
}
