import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:mobx/mobx.dart';

part 'restaurants_controller.g.dart';

class RestaurantsController = _RestaurantsControllerBase with _$RestaurantsController;

abstract class _RestaurantsControllerBase with Store {
  @observable
  List<Restaurant> listRestaurant = [];

  @action
  void getRestaurants() {
    listRestaurant = [];
  }
}
