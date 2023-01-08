class UsersModel {
  int? id;
  String? username;
  String? password;
  String? fullname;
  String? image;
  int? balance;
  String? token;

  UsersModel({
    this.id,
    this.username,
    this.password,
    this.fullname,
    this.image,
    this.balance,
    this.token,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    fullname = json['fullname'];
    image = json['image'];
    balance = json['balance'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'fullname': fullname,
      'image': image,
      'balance': balance,
      'token': token,
    };
  }
}
