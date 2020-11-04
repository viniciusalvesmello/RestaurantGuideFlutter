import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_review_model.dart';

abstract class IRestaurantRepository {
  Future<List<RestaurantReview>> getRestaurantReview(
    int id, {
    int start = 0,
    int count = 10,
  });
}

class RestaurantRepository implements IRestaurantRepository {
  final IClientHttpService client;
  final apiVersion = "v2.1";

  RestaurantRepository({this.client});

  Future<List<RestaurantReview>> getRestaurantReview(
    int id, {
    int start = 0,
    int count = 10,
  }) async {
    var json = await client.get("/api/$apiVersion/reviews");

    var reviews = [];
    if (json["user_reviews"] != null) {
      reviews = (json["user_reviews"] as List)
          .map((item) => RestaurantReview.fromJson(item))
          .toList();
    }

    return reviews;
  }
}
