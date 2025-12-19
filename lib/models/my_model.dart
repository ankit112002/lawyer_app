class Model {
  String? message;
  String? chatId;

  Model({this.message, this.chatId});

  Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['chat_id'] = this.chatId;
    return data;
  }
}
