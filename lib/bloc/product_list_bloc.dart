import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_app/data_source/product_list_data_source.dart';
import 'package:phone_app/models/product_model.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';
part 'product_list_bloc.freezed.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListDataSource productListDataSource = ProductListDataSource();
  ProductListBloc() : super(const _Initial()) {
    on<ProductListEvent>((event, emit) async {
      await event.when(started: (skip, limit) async {
        emit(const ProductListState.loading());
        print('nn');
        try {
          final dataResponse =
              await productListDataSource.productList(skip, limit);
         
          if (dataResponse!=null) {
            print('hhh');
            emit(ProductListState.success(dataResponse));
          } else {
            emit(const ProductListState.failure());
            print('fail');
          }
        } catch (e) {
          emit(const ProductListState.failure());
        }
      });
    });
  }
}
