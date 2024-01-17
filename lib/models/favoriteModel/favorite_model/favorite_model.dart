import 'data.dart';

class FavoriteSModel {
  bool? status;
  dynamic message;
  Data? data;

  FavoriteSModel({this.status, this.message, this.data});

  factory FavoriteSModel.fromJson(Map<String, dynamic> json) => FavoriteSModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
