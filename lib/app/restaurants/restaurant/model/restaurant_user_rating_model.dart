class RestaurantUserRating {
  String rating;
  String ratingDescription;

  RestaurantUserRating({this.rating, this.ratingDescription});

  RestaurantUserRating.fromJson(Map<String, dynamic> json) {
    rating = json['aggregate_rating'].toString();
    ratingDescription = json['rating_text'];
  }
}
