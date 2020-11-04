import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'model/restaurant_model.dart';
import 'restaurant_controller.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantPage({
    Key key,
    this.restaurant,
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
        title: Text(widget.restaurant.name),
      ),
      body: Column(),
    );
  }
}
