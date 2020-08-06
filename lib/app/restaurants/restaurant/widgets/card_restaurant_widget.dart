import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/model/restaurant_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardRestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurantWidget({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurantImage = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 108,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
        child: Expanded(
          child: CachedNetworkImage(
            imageUrl: restaurant.image,
            placeholder: (context, url) => new Center(
              child: Image.asset('assets/images/loading.gif'),
            ),
            errorWidget: (context, url, error) => new Center(
              child: Image.asset('assets/images/no_image.png'),
            ),
            width: 100,
            height: 108,
            fit: BoxFit.cover,
          ),
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
          onTap: () {},
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
