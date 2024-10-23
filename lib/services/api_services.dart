import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';
import '../utils/api_error_handler.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static var client = http.Client();
  static const apiUrl = "https://fakestoreapi.com";

  static Future<List<Product>> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse('$apiUrl/products'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("Your response is $jsonString");
        return (json.decode(jsonString) as List)
            .map((i) => Product.fromJson(i))
            .toList();
      } else {
        ApiErrorHandler.handleError(response.statusCode, response.body);
        return [];
      }
    } catch (e) {
      debugPrint("An error occurred: $e");
      Get.snackbar("An error occurred", e.toString());
      return [];
    }
  }
}
