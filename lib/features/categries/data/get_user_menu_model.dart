class GetUserMenuModel {
  Menu? menu;
  bool? exists;

  GetUserMenuModel({this.menu, this.exists});

  GetUserMenuModel.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    data['exists'] = this.exists;
    return data;
  }
}

class Menu {
  String? sId;
  String? user;
  List<MealModel>? breakFast;
  List<MealModel>? lunch;
  List<MealModel>? drinks;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Menu(
      {this.sId,
        this.user,
        this.breakFast,
        this.lunch,
        this.drinks,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Menu.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    if (json['breakFast'] != null) {
      breakFast = <MealModel>[];
      json['breakFast'].forEach((v) {
        breakFast!.add(new MealModel.fromJson(v));
      });
    }
    if (json['lunch'] != null) {
      lunch = <MealModel>[];
      json['lunch'].forEach((v) {
        lunch!.add(new MealModel.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = <MealModel>[];
      json['drinks'].forEach((v) {
        drinks!.add(new MealModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.breakFast != null) {
      data['breakFast'] = this.breakFast!.map((v) => v.toJson()).toList();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.map((v) => v.toJson()).toList();
    }
    if (this.drinks != null) {
      data['drinks'] = this.drinks!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class MealModel {
  String? sId;
  String? name;
  int? price;
  String? category;
  String? img;
  String? type;
  int? iV;

  MealModel(
      {this.sId,
        this.name,
        this.price,
        this.category,
        this.img,
        this.type,
        this.iV});

  MealModel.fromJson(Map<String, dynamic> json) {
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
