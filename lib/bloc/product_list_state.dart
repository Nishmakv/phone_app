part of 'product_list_bloc.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;
  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.success(ProductList productListModel) =
      Success;
  const factory ProductListState.failure() = Failure;

// @Implements(DetailsLoading)
  //   const factory ProductListState.detailsLoading() = DetailsLoading;
  // const factory ProductListState.detailsSuccess() = DetailsSuccess;
  // const factory ProductListState.detailsFailure() = DetailsFailure;


}
