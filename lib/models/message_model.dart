class MessageModel {
  String? massage;
  bool? isUser;

  MessageModel({
    this.massage,
    this.isUser,
  });

  factory MessageModel.fromJson(Map<dynamic, dynamic> json) {
    return MessageModel(
      massage: json['massage'],
      isUser: json['isUser'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'massage': massage,
      'isUser': isUser,
    };
  }
}
