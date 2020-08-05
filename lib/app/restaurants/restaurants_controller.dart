import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'restaurants_controller.g.dart';

class RestaurantsController = _RestaurantsControllerBase
    with _$RestaurantsController;

abstract class _RestaurantsControllerBase with Store {
  final IRestaurantsRepository repository = Modular.get();

  @observable
  ObservableList<Restaurant> listRestaurant = ObservableList<Restaurant>.of([]);

  @action
  Future<void> getRestaurants(
      {int cityId = 0, int count = 10, start = 0}) async {
    listRestaurant.addAll(
      await repository.getRestaurants(
        cityId: cityId,
        count: count,
        start: start,
      ),
    );
  }
}
