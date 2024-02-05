import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_app/data_source/product_details_data_source.dart';
import 'package:phone_app/models/product_model.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';
part 'product_detail_bloc.freezed.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductetailsDataSource productDetailsDataSource =
      ProductetailsDataSource();

  ProductDetailBloc() : super(_Initial()) {
    on<ProductDetailEvent>((event, emit) async {
      await event.when(
        details: (id) async {
          emit(ProductDetailState.loading());
          try {
            final dataResponse =
                await productDetailsDataSource.productDetailsById(id);

            if (dataResponse != null) {
              emit(ProductDetailState.success(dataResponse));
            } else {
              emit(ProductDetailState.failure());
            }
          } catch (e) {
            emit(ProductDetailState.failure());
          }
        },
      );
    });
  }
}
