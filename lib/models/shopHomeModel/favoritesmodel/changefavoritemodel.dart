class FavoriteModel {
  bool? status;
  String? msg;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['message'];
  }
}
