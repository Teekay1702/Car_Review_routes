import 'dart:convert';

import 'package:http/http.dart';

import '../models/car_review.dart';

class CarReviewService {
  static Future<List<CarReview>> getCarReviewData() async {
    List<CarReview> reviews = [];
    Map<String, dynamic> map = {};

    final response = await get(
      Uri.parse(
          'https://dl.dropboxusercontent.com/s/m8saoxxi9fyz7lj/cars.json?dl=0'),
    );

    if (response.statusCode == 200) {
      try {
        map = jsonDecode(response.body);

        for (var item in map['items']) {
          reviews.add(
            CarReview(
              car: item['car'],
              image: item['image'],
              price: item['price'],
              review: item['review'],
            ),
          );
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    } else {
      throw Exception(
          'Error: Could be something wrong with your internet connection.');
    }

    return reviews;
  }
}
