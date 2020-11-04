import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_category_model.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';

abstract class IRestaurantsRepository {
  Future<List<RestaurantCategory>> getRestaurantsCategories();
  Future<List<Restaurant>> getRestaurants({
    int cityId = 0,
    int count = 10,
    int start = 0,
  });
}

class RestaurantsRepository implements IRestaurantsRepository {
  final IClientHttpService client;
  final apiVersion = "v2.1";

  RestaurantsRepository({this.client});

  @override
  Future<List<RestaurantCategory>> getRestaurantsCategories() async {
    var json = await client.get("/api/$apiVersion/categories");

    var listRestaurantsCategories = [];

    if (json["categories"] != null) {
      listRestaurantsCategories = (json["categories"] as List)
          .map((item) => RestaurantCategory.fromJson(item))
          .toList();
    }

    return listRestaurantsCategories;
  }

  @override
  Future<List<Restaurant>> getRestaurants({
    int cityId = 0,
    int count = 10,
    int start = 0,
  }) async {
    var json = await client.get(
        "/api/$apiVersion/search?entity_id=$cityId&entity_type=city&sort=rating&order=desc&count=$count&start=$start");

    var listRestaurants = [];

    if (json["restaurants"] != null) {
      listRestaurants = (json["restaurants"] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    }

    return listRestaurants;
  }
}
