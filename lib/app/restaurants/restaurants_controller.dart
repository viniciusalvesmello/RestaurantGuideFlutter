import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'restaurants_controller.g.dart';

class RestaurantsController = _RestaurantsControllerBase
    with _$RestaurantsController;

abstract class _RestaurantsControllerBase with Store {
  final IRestaurantsRepository repository = Modular.get();

  var page = 1;
  var count = 10;

  @observable
  bool loading = false;

  @observable
  ObservableList<Restaurant> listRestaurant = ObservableList<Restaurant>.of([]);

  @computed
  bool get isFirstLoading {
    return loading && listRestaurant.isEmpty;
  }

  @action
  Future<void> getRestaurants(
      {int cityId = 0, int count = 10, start = 0}) async {
    loading = true;

    if (start == 0) {
      listRestaurant.clear();
    }

    listRestaurant.addAll(
      await repository.getRestaurants(
        cityId: cityId,
        count: count,
        start: start,
      ),
    );

    loading = false;
  }
}
