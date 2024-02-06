import 'package:freezed_annotation/freezed_annotation.dart';
part of 'product_add_bloc.dart';

@freezed
class ProductAddEvent with _$ProductAddEvent {
  const factory ProductAddEvent.addProduct({
    required String title,
    required String description,
    required String category,
    required String brand,
    required int price,
  }) = AddProduct;
}
