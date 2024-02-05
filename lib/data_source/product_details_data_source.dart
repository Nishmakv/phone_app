import 'package:dio/dio.dart';
import 'package:phone_app/models/product_details_by_id.dart';
import 'package:phone_app/models/product_model.dart';

class ProductetailsDataSource {
  Dio client = Dio();
  Future productDetailsById(int? id) async {
    Product productData;
    final response =
        await client.get('https://dummyjson.com/products/${id.toString()}',
            options: Options(headers: {
              'content-type': 'application/json',
            }));
    productData = Product.fromJson(response.data);
    return productData;
  }
}
