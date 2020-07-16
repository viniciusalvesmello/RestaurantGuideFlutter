import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';

abstract class IRestaurantsRepository {
  Future<List<Restaurant>> getRestaurants(
      {int cityId = 0, int count = 10, start = 0});
}

class RestaurantsRepository implements IRestaurantsRepository {
  final IClientHttpService client;

  RestaurantsRepository(this.client);

  @override
  Future<List<Restaurant>> getRestaurants(
      {int cityId = 0, int count = 10, start = 0}) async {
    var json = await client.get(
        "/api/v2.1/search?entity_id=$cityId&entity_type=city&sort=rating&order=desc&count=$count&start=$start");

    var listRestaurants = [];

    if (json["restaurants"] != null) {
      listRestaurants = (json["restaurants"] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    }

    return listRestaurants;
  }
}
