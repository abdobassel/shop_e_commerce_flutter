class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> proudcts = [];
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element) {
      proudcts.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int? id;
  String? img;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['image'];
  }
}

class ProductModel {
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  int? id;
  String? img;
  bool? incart;
  String? name;
  bool? infav;

  ProductModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    id = json['id'];
    img = json['image'];
    incart = json['in_cart'];
    infav = json['in_favourites'];
    name = json['name'];
  }
}
