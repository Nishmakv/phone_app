import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_app/data_source/product_add_data_source.dart';

part 'product_add_event.dart';
part 'product_add_state.dart';


class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  AddProductDataSource addProductDataSource = AddProductDataSource();
  ProductAddBloc() : super(const _Initial()) {
    on<ProductAddEvent>((event, emit) async {
      await event.when(
        addProduct: (addProductEvent) async {
          emit(const ProductAddState.loading());
          try {
            final dataResponse = await addProductDataSource.addProduct(
              title: addProductEvent.title,
              description: addProductEvent.description,
              category: addProductEvent.category,
              brand: addProductEvent.brand,
              price: addProductEvent.price,
            );

            if (dataResponse != null) {
              emit(const ProductAddState.success());
            } else {
              emit(const ProductAddState.failure());
            }
          } catch (e) {
            emit(const ProductAddState.failure());
          }
        },
      );
    });
  }
}
