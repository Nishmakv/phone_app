import 'package:dio/dio.dart';
import 'package:phone_app/models/product_details_by_id.dart';

class ProductetailsDataSource {
  Dio client = Dio();
  Future productDetailsById(int? id) async {
    ProductDetailsById productDetailsByIdModel;
    final response =
        await client.get('https://dummyjson.com/products/${id.toString()}',
            options: Options(headers: {
              'content-type': 'application/json',
            }));

    try {
      productDetailsByIdModel = ProductDetailsById.fromJson(response.data);

      return productDetailsByIdModel;
    } catch (e) {
      print(e);
    }
  }
}
