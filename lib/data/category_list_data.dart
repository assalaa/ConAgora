class MenuModel {
  String? categoryId;
  String? categoryName;
  List<Dish>? dishes;

  MenuModel({this.categoryId, this.categoryName, this.dishes});

  MenuModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    if (json['dishes'] != null) {
      dishes = <Dish>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dish.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dish {
  String? dishName;
  String? dishDescription;
  double? dishPrice;

  Dish({this.dishName, this.dishDescription, this.dishPrice});

  Dish.fromJson(Map<String, dynamic> json) {
    dishName = json['dishName'];
    dishDescription = json['dishDescription'];
    dishPrice = json['dishPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['dishName'] = dishName;
    data['dishDescription'] = dishDescription;
    data['dishPrice'] = dishPrice;
    return data;
  }
}

//List<MenuModel> myCategories = [];
  //),
//];
