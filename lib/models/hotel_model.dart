class HotelModel {
  final String name;
  final String image;
  final String price;
  final String location;
  final String details;
  final String city;

  HotelModel({
    required this.name,
    required this.image,
    required this.price,
    required this.location,
    required this.details,
    required this.city,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
        name: json['name'],
        image: json['imageurl'],
        price: json['price'],
        location: json['location'],
        details: json['details'],
        city: json['city']);
  }
}
