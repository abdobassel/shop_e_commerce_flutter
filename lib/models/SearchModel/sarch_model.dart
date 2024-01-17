class SarchModel {
  int? id;
  dynamic price;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;
  bool? inFavorites;
  bool? inCart;

  SarchModel({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory SarchModel.fromJson(Map<String, dynamic> json) => SarchModel(
        id: json['id'] as int?,
        price: json['price'] as dynamic,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
