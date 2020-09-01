import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurant_controller.dart';

class RestaurantPage extends StatefulWidget {
  final String restaurantId;
  final String restaurantName;
  const RestaurantPage({
    Key key,
    this.restaurantId = "0",
    this.restaurantName = "",
  }) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState
    extends ModularState<RestaurantPage, RestaurantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
