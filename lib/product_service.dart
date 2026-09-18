import 'package:dio/dio.dart';
import 'product_model.dart';

class ProductService {
  final Dio dio = Dio();
  final String url = 'https://accessories-eshop.runasp.net/api/products';

  Future<List<Product>> getProducts() async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;

      List products = data['items'];

      return products
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed');
    }
  }
}