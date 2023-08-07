import 'package:food_ox/features/categries/data/get_user_menu_model.dart';

class GetDayFoodModel {
  Order? order;

  GetDayFoodModel({this.order});

  GetDayFoodModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  String? user;
  List<MealModel>? foods;
  String? date;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Order(
      {this.user,
        this.foods,
        this.date,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    if (json['foods'] != null) {
      foods = <MealModel>[];
      json['foods'].forEach((v) {
        foods!.add(new MealModel.fromJson(v));
      });
    }
    date = json['date'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

