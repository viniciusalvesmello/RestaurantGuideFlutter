import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'model/restaurant_review_model.dart';
import 'restaurant_repository.dart';

part 'restaurant_controller.g.dart';

class RestaurantController = _RestaurantControllerBase
    with _$RestaurantController;

abstract class _RestaurantControllerBase with Store {
  final IRestaurantRepository repository = Modular.get();

  @observable
  bool loadingRestaurantReview = false;

  @observable
  ObservableList<RestaurantReview> listRestaurantReview =
      ObservableList<RestaurantReview>.of([]);

  @action
  Future<void> getRestaurantReview(
    int id, {
    int start = 0,
    int count = 10,
  }) async {
    loadingRestaurantReview = true;

    listRestaurantReview = await repository.getRestaurantReview(
      id,
      start: start,
      count: count,
    );

    loadingRestaurantReview = false;
  }
}
