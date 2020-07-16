class RestaurantLocation {
  String locality;
  String address;
  String latitude;
  String longitude;

  RestaurantLocation(
      {this.locality, this.address, this.latitude, this.longitude});

  RestaurantLocation.fromJson(Map<String, dynamic> json) {
    locality = json['locality_verbose'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
