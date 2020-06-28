import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurants_controller.dart';

class RestaurantsPage extends StatefulWidget {
  final String title;
  final String cityId;
  const RestaurantsPage({Key key, this.title = "Restaurants", this.cityId = "0"})
      : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState
    extends ModularState<RestaurantsPage, RestaurantsController> {
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[Text("Cidade Id: ${widget.cityId}")],
      ),
    );
  }
}
