class RestaurantReview {
  int id;
  int rating;
  String ratingText;
  String reviewTimeFriendly;
  String reviewText;
  String userName;
  String userProfileImage;

  RestaurantReview({
    this.id,
    this.rating,
    this.ratingText,
    this.reviewTimeFriendly,
    this.reviewText,
    this.userName,
    this.userProfileImage,
  });

  RestaurantReview.fromJson(Map<String, dynamic> json) {
    var review = json["review"];
    var user = review["user"];

    id = review["id"];
    rating = review["rating"];
    ratingText = review["rating_text"];
    reviewTimeFriendly = review["review_time_friendly"];
    reviewText = review["review_text"];
    userName = user["name"];
    userProfileImage = user["profile_image"];
  }
}
