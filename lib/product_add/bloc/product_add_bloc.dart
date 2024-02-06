import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_app/data_source/product_add_data_source.dart';

part 'product_add_event.dart';
part 'product_add_state.dart';
part 'product_add_bloc.freezed.dart';

class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  final AddProductDataSource addProductDataSource = AddProductDataSource();
  ProductAddBloc() : super(_Initial()) {
    on<ProductAddEvent>((event, emit) async {
      await event.when(
          addProduct: (title, description, brand, category, price) async {
        emit(ProductAddState.loading());
        try {
          final dataResponse = await addProductDataSource.addProduct(
              title: title,
              description: description,
              brand: brand,
              category: category,
              price: price);
          if (dataResponse != null) {
            emit(ProductAddState.success());
          } else {
            emit(ProductAddState.failure());
          }
        } catch (e) {
          emit(ProductAddState.failure());
        }
      });
    });
  }
}
