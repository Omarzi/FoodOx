class GetCategoryModel {
  List<Food>? food;

  GetCategoryModel({this.food});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['food'] != null) {
      food = <Food>[];
      json['food'].forEach((v) {
        food!.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.food != null) {
      data['food'] = this.food!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  String? sId;
  String? name;
  int? price;
  String? category;
  String? img;
  String? type;
  int? iV;

  Food(
      {this.sId,
        this.name,
        this.price,
        this.category,
        this.img,
        this.type,
        this.iV});

  Food.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    img = json['img'];
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['category'] = this.category;
    data['img'] = this.img;
    data['type'] = this.type;
    data['__v'] = this.iV;
    return data;
  }
}
