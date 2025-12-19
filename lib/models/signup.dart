class SignupModel {
  bool? success;
  String? message;
  User? user;
  String? accessToken;

  SignupModel({this.success, this.message, this.user, this.accessToken});

  SignupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  bool? isAdmin;
  String? userType;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? id;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerified,
        this.isAdmin,
        this.userType,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    isAdmin = json['isAdmin'];
    userType = json['userType'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['isAdmin'] = this.isAdmin;
    data['userType'] = this.userType;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
