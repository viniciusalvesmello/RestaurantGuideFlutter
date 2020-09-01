import 'package:mobx/mobx.dart';

part 'restaurant_controller.g.dart';

class RestaurantController = _RestaurantControllerBase
    with _$RestaurantController;

abstract class _RestaurantControllerBase with Store {}
