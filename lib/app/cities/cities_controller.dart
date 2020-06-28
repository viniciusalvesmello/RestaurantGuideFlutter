import 'package:RestaurantGuideFlutter/app/cities/cities_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'city/model/city_model.dart';

part 'cities_controller.g.dart';

class CitiesController = _CitiesControllerBase with _$CitiesController;

abstract class _CitiesControllerBase with Store {
  final citiesRepository = Modular.get<CitiesRepository>();

  @observable
  List<City> cities = [];

  @action
  void getCities() {
    cities = citiesRepository.getCities();
  }
}