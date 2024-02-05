part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;

  const factory ProductDetailState.loading() = _Loading;
  const factory ProductDetailState.success(Product productDetailModel) =
      Success;
  const factory ProductDetailState.failure() = Failure;
}
