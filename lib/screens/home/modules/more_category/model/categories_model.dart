class CategoriesModel {
  String? name;
  String? image;
  String? colorCode;
  int? id;

  CategoriesModel({this.name, this.image, this.id, this.colorCode});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
    colorCode = json['colorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['id'] = id;
    data['colorCode'] = colorCode;
    return data;
  }
}
