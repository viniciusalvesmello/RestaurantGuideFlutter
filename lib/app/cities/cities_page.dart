import 'package:RestaurantGuideFlutter/app/cities/city/widgets/card_city_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cities_controller.dart';

class CitiesPage extends StatefulWidget {
  final String title;
  final String description;
  const CitiesPage(
      {Key key,
      this.title = "Guia dos melhores Restarantes",
      this.description = "Selecione sua cidade preferida"})
      : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends ModularState<CitiesPage, CitiesController> {
  @override
  Widget build(BuildContext context) {
    var appBarCities = AppBar(
      toolbarHeight: 120,
      title: Wrap(children: [
        Expanded(
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ]),
    );

    controller.getCities();

    return Scaffold(
      appBar: appBarCities,
      body: SafeArea(
        child: Observer(builder: (_) {
          var listCities = <Widget>[];

          for (var rowCity in controller.cities) {
            listCities.add(CardCityWidget(
              city: rowCity,
            ));
          }

          return ListView(
            children: listCities,
          );
        }),
      ),
    );
  }
}
