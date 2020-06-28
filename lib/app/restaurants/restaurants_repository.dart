
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IRestaurantsRepository extends Disposable {
  List<Restaurant> getRestaurants({int cityId});
}

class RestaurantsRepository implements IRestaurantsRepository {
  final DioForNative client;

  RestaurantsRepository(this.client);

  @override
  List<Restaurant> getRestaurants({int cityId}) {
    return [];
  }

  @override
  void dispose() {}
}
