class ShopLoginModel {
  bool? status;
  String? msg;
  ShopUserData? data;
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['message'];
    data = json['data'] != null ? ShopUserData.fromJson(json['data']) : null;
  }
}

class ShopUserData {
  int? id;
  String? name;
  String? token;
  String? phone;
  String? img;
  int? points;
  int? credit;

  ShopUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    phone = json['phone'];
    img = json['image'];
    points = json['points'];
    credit = json['credit'];
  }
}
