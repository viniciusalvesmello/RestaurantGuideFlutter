
import 'package:RestaurantGuideFlutter/app/app_module.dart';
import 'package:RestaurantGuideFlutter/app/cities/cities_module.dart';
import 'package:RestaurantGuideFlutter/app/cities/cities_page.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  initModule(AppModule());
  initModule(CitiesModule());
  
  test('when get class CitiesPage should check constructor data', () {
    final CitiesPage citiesPage = CitiesPage();

    expect(citiesPage.title, "Guia dos melhores Restarantes");
    expect(citiesPage.description, "Selecione sua cidade preferida");
  });
}