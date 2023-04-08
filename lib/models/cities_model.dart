class CityModel{
  final String name;
  final String image;

  CityModel({required this.image, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(image: json['imageurl'], name: json['name']);
  }
}