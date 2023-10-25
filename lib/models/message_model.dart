import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  // int? id;
  String? massage;
  int? user_id;
  String? comp_name;
  // String? sender_user;
  final Timestamp timeStamp; // 34an l tarteb bta3 l message

  MessageModel({
    this.massage,
    // this.sender_user,
    this.user_id,
    // this.id,
    this.comp_name,
    required this.timeStamp,
  });

  factory MessageModel.fromJson(Map<dynamic, dynamic> json) {
    return MessageModel(
      massage: json['massage'],
      // sender_user: json['sender_user'],
      user_id: json['user_id'],
      // id: json['id'],
      comp_name: json['comp_name'],
      timeStamp: Timestamp.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'massage': massage,
      //     // 'sender_user': sender_user,
      'user_id': user_id,
      //     // 'id': id,
      'comp_name': comp_name,
      'timeStamp': timeStamp,
    };
  }
}
