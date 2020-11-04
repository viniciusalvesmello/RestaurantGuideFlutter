import 'package:RestaurantGuideFlutter/app/core/utils/functions/image_functions.dart';
import 'package:RestaurantGuideFlutter/app/modules/cities/city/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardCityWidget extends StatelessWidget {
  final City city;

  const CardCityWidget({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityImage = Expanded(
      child: Container(
        height: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.0),
            topLeft: Radius.circular(4.0),
          ),
          child: Image.network(
            city.imageUrl,
            loadingBuilder: imageLoading(),
            errorBuilder: imageError(),
            fit: BoxFit.cover,
          ),
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
      child: Card(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed("/restaurants/${city.id}/${city.name}");
          },
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
