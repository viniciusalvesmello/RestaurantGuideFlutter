import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/widgets/card_restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurants_controller.dart';

class RestaurantsPage extends StatefulWidget {
  final String title;
  final String cityId;
  final String cityName;
  const RestaurantsPage(
      {Key key,
      this.title = "Os melhores restaurants de",
      this.cityId = "0",
      this.cityName = ""})
      : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState
    extends ModularState<RestaurantsPage, RestaurantsController> {
  @override
  Widget build(BuildContext context) {
    var appBarRestaurants = AppBar(
      toolbarHeight: 120,
      title: Column(
        children: [
          Row(children: [
            Expanded(
              child: Center(
                child: Text(widget.title,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ),
            ),
          ]),
          Row(children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.cityName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ]),
        ],
      ),
    );

    var page = 1;
    var count = 10;
    controller.getRestaurants(
      cityId: int.parse(widget.cityId),
      count: count,
    );

    return Scaffold(
      appBar: appBarRestaurants,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Observer(builder: (_) {
            try {
              if (!controller.isFirstLoading) {
                return ListView.builder(
                  itemCount: controller.listRestaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == controller.listRestaurant.length - 1) {
                      page++;

                      controller.getRestaurants(
                        cityId: int.parse(widget.cityId),
                        start: page * count,
                      );
                    }

                    if (!controller.loading) {
                      return CardRestaurantWidget(
                        restaurant: controller.listRestaurant[index],
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          CardRestaurantWidget(
                            restaurant: controller.listRestaurant[index],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            } catch (e) {
              return Text(e.toString());
            }
          }),
        ),
      ),
    );
  }
}
