import 'package:RestaurantGuideFlutter/app/core/utils/functions/image.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardRestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurantWidget({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurantImage = Container(
      width: 90,
      height: 90,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
        child: Image.network(
          restaurant.image,
          loadingBuilder: imageLoading(),
          errorBuilder: imageError(),
          fit: BoxFit.cover,
        ),
      ),
    );

    var restaurantDescription = Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  "${restaurant.userRating.rating} - ${restaurant.userRating.ratingDescription}",
                  style: TextStyle(fontSize: 8),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  restaurant.location.address,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ]),
      ),
    );

    return Center(
      child: Card(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: InkWell(
          onTap: () {
            Modular.link
                .pushNamed("/restaurant/${restaurant.id}/${restaurant.name}");
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              restaurantImage,
              restaurantDescription,
            ],
          ),
        ),
      ),
    );
  }
}
