import 'package:dio/dio.dart';
import 'package:phone_app/models/product_model.dart';

class AddProductDataSource {
  Dio client = Dio();

  Future addProduct({
    required String? title,
    required String? description,
    required String? brand,
    required String? category,
    required int price,
  }) async {
    Product addProduct;

    final response = await client.post(
      'https://dummyjson.com/products/add',
      data: {
        "title": title,
        "description": description,
        "brand": brand,
        "category": category,
        "price": price,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    print(response.data);
    print(';;;;');

    if (response.data['id'] != null) {
      return ['response'];
    } else {
      return [];
    }
  }
}
