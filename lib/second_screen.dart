import 'package:asmaarahy4/second_screen.dart';
class ProductsData {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }



}


class Rating {
  dynamic rate;
  int? count;
  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];

  }

}