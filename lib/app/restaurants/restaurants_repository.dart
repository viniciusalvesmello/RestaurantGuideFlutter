import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';

abstract class IRestaurantsRepository {
  Future<List<Restaurant>> getRestaurants({int cityId});
}

class RestaurantsRepository implements IRestaurantsRepository {
  final IClientHttpService client;

  RestaurantsRepository(this.client);

  @override
  Future<List<Restaurant>> getRestaurants({int cityId}) async {
    var json = await client.get("/api/v2.1/search");

    var listRestaurants = [];

    if (json["restaurants"] != null) {
      listRestaurants = (json["restaurants"] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    }

    return listRestaurants;
  }
}
