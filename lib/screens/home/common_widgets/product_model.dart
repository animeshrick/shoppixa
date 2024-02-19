class Product {
  int? pID;
  String? name;
  String? description;
  int? mrp;
  int? ofrPrice;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  bool? isFavourite;

  Product(
      {this.pID,
      this.name,
      this.description,
      this.mrp,
      this.ofrPrice,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.isFavourite,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    pID = json['id'];
    name = json['name'];
    description = json['description'];
    mrp = json['mrp'];
    ofrPrice = json['ofrPrice'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    isFavourite = json['favourite'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = pID;
    data['name'] = name;
    data['description'] = description;
    data['mrp'] = mrp;
    data['ofrPrice'] = ofrPrice;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    data['favourite'] = isFavourite;
    return data;
  }
}

final List<Product> products = [
  Product(
      pID: 123,
      name: 'Smart Watch',
      description: 'Smart Watches - Up to 70% Off - Buy Premium',
      thumbnail: 'assets/images/ps4_console_blue_1.png',
      images: [
        "assets/images/galaxy_watch_4_2.png",
        "assets/images/galaxy_watch_4_1.png",
        "assets/images/beats_studio_3-3.png"
      ],
      mrp: 5500,
      ofrPrice: 2500,
      isFavourite: true),
  Product(
      pID: 123,
      name: 'Samsung A53',
      description: 'Samsung Galaxy A53 5G, Super AMOLED',
      thumbnail: 'assets/images/a53_1.png',
      mrp: 28499,
      ofrPrice: 25799,
      isFavourite: true),
  Product(
      pID: 123,
      name: 'Apple Watch Series 7-1',
      description:
          'Apple Watch Series 7 features the largest, most advanced display yet, breakthrough health innovations, and is the most durable Apple Watch ever.',
      thumbnail: 'assets/images/apple_watch_series_7_1.png',
      mrp: 5500,
      ofrPrice: 2500,
      isFavourite: false),
  Product(
      pID: 123,
      name: 'Smart Watch',
      description: 'Smart Watches - Up to 70% Off - Buy Premium',
      thumbnail: 'assets/images/beats_studio_3-3.png',
      mrp: 5500,
      ofrPrice: 2500,
      isFavourite: false),
];
