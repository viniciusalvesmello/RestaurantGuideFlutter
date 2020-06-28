import 'package:RestaurantGuideFlutter/app/cities/city/widgets/city/city_widget.dart';
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
  final citiesController = Modular.get<CitiesController>();

  @override
  Widget build(BuildContext context) {
    var appBarCities = AppBar(
      toolbarHeight: 120,
      title: Column(
        children: [
          Row(children: [
            Expanded(
              child: Center(
                child: Text(widget.title),
              ),
            ),
          ]),
          Row(children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.description,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ),
            ),
          ]),
        ],
      ),
    );

    return Scaffold(
      appBar: appBarCities,
      body: Observer(builder: (_) {
        var listCities = <Widget>[];
        citiesController.getCities();
        for (var rowCity in citiesController.cities) {
          listCities.add(CityWidget(
            city: rowCity,
          ));
        }

        return ListView(
          children: listCities,
        );
      }),
    );
  }
}
