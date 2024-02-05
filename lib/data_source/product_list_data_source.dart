import 'package:dio/dio.dart';
import 'package:phone_app/models/product_model.dart';

class ProductListDataSource {
  Dio client = Dio();
  Future<ProductList> productList(int skip, int limit) async {
    ProductList productListModel;

    final response =
        await client.get('https://dummyjson.com/products?skip=5&limit=10',
            options: Options(headers: {
              'content-type': 'application/json',
            }));

    print('hey');
    productListModel = ProductList.fromJson(response.data);
    print('hello');

    print(response);

    return productListModel;
  }
}
