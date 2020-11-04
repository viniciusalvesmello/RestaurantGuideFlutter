import 'restaurant_location_model.dart';
import 'restaurant_user_rating_model.dart';

class Restaurant {
  String id;
  String name;
  String cuisines;
  String phoneNumbers;
  String thumb;
  String image;
  RestaurantUserRating userRating;
  RestaurantLocation location;

  Restaurant(
      {this.id,
      this.name,
      this.cuisines,
      this.phoneNumbers,
      this.thumb,
      this.image,
      this.userRating,
      this.location});

  Restaurant.fromJson(Map<String, dynamic> json) {
    var restaurant = json['restaurant'];

    id = restaurant['id'];
    name = restaurant['name'];
    cuisines = restaurant['cuisines'];
    phoneNumbers = restaurant['phone_numbers'];
    thumb = restaurant['thumb'];
    image = restaurant['featured_image'];
    userRating = RestaurantUserRating.fromJson(restaurant['user_rating']);
    location = RestaurantLocation.fromJson(restaurant['location']);
  }
}
