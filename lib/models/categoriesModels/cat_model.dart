class CatModel {
  bool? status;
  CatDataModel? data;
  CatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CatDataModel.fromJson(json["data"]);
  }
}

class CatDataModel {
  int? currentPage;
  List<DataModel> data = [];
  CatDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int? id;
  String? name;
  String? img;
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['image'];
  }
}
