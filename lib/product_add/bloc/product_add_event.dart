part of 'product_add_bloc.dart';

@freezed
class ProductAddEvent with _$ProductAddEvent {
  const factory ProductAddEvent.addProduct({
    required String title,
    required String description,
    required String brand,
    required String category,
    required int price,
  }

  ) = _AddProduct;
}