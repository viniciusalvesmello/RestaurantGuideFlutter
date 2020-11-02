class RestaurantCategory {
  String id;
  String name;

  RestaurantCategory({this.id, this.name});

  RestaurantCategory.fromJson(Map<String, dynamic> json) {
    var categories = json['categories'];

    id = categories["id"];
    name = categories["name"];
  }
}
