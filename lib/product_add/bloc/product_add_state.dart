part of 'product_add_bloc.dart';

@freezed
class ProductAddState with _$ProductAddState {
  const factory ProductAddState.initial() = _Initial;
   const factory ProductAddState.loading() = _Loading;
    const factory ProductAddState.success() = Success;
     const factory ProductAddState.failure() = _Failure;
}
