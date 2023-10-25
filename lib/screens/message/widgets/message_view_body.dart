import 'package:flutter/material.dart';

import 'company_messages_list_view.dart';
import 'custom_search_message.dart';

class MessageViewBody extends StatefulWidget {
  const MessageViewBody({
    super.key,
  });

  @override
  State<MessageViewBody> createState() => _MessageViewBodyState();
}

class _MessageViewBodyState extends State<MessageViewBody> {
  late TextEditingController textEditingController;
  late ScrollController scrollController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // final Stream<QuerySnapshot> _messagesStream = FirebaseFirestore.instance
  //     .collection(kMessagesCollections)
  //     .orderBy('timeStamp', descending: true)
  //     .snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomSearchMessage(),
        ),
        CompanyMessagesListView(),
      ],
    );
  }
}
