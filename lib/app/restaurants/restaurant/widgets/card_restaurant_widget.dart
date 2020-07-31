import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CardRestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurantWidget({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurantImage = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 90,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
        child: Stack(
          children: <Widget>[
            Center(child: Image.asset('assets/images/loading.gif')),
            Expanded(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: restaurant.image,
                width: 100,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );

    var restaurantDescription = Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Row(children: [
                Text(
                  "${restaurant.userRating.rating} - ${restaurant.userRating.ratingDescription}",
                  style: TextStyle(fontSize: 8),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(children: [
                  Center(
                    child: Text(
                      restaurant.location.address,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );

    return Center(
      child: Card(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: InkWell(
          onTap: () {},
          child: Row(
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
