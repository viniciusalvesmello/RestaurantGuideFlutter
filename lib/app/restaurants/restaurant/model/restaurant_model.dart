class Restaurant {
  int id;
  String name;
  String cuisines;
  String phoneNumbers;
  String thumb;
  String image;
  String rating;
  String ratingDescription;
  String locality;
  String address;
  String latitude;
  String longitude;

  Restaurant(
      {this.id,
      this.name,
      this.cuisines,
      this.phoneNumbers,
      this.thumb,
      this.image,
      this.rating,
      this.ratingDescription,
      this.locality,
      this.address,
      this.latitude,
      this.longitude});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['restaurant']['id'];
    name = json['restaurant']['name'];
    cuisines = json['restaurant']['cuisines'];
    phoneNumbers = json['restaurant']['phone_numbers'];
    thumb = json['restaurant']['thumb'];
    image = json['restaurant']['featured_image'];
    rating = json['restaurant']['user_rating']['aggregate_rating'];
    ratingDescription = json['restaurant']['user_rating']['rating_text'];
    locality = json['restaurant']['location']['locality_verbose'];
    address = json['restaurant']['location']['address'];
    latitude = json['restaurant']['location']['latitude'];
    longitude = json['restaurant']['location']['longitude'];
  }
}
