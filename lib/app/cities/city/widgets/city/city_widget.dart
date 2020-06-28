import 'package:RestaurantGuideFlutter/app/cities/city/model/city_model.dart';
import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final City city;

  const CityWidget({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityImage = Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.0), topLeft: Radius.circular(4.0)),
        child: Image.network(
          city.imageUrl,
        ),
      ),
    );

    var cityName = Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            city.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );

    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/cities/city/restaurants/${city.id}");
        },
        child: Card(
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(children: [cityImage]),
              Row(children: [cityName]),
            ],
          ),
        ),
      ),
    );
  }
}
