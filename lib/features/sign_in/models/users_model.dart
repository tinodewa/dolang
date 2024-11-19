class UsersModel {
  String? username;
  String? password;
  String? email;
  String? phoneNumber;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? userId;

  UsersModel(
      {this.username,
      this.password,
      this.email,
      this.phoneNumber,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.userId});

  UsersModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['user_id'] = userId;
    return data;
  }
}
