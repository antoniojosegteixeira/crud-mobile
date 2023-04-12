import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/get_product_list.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required this.getProductListUsecase,
  }) : super(ProductLoading());

  GetProductList getProductListUsecase;

  Future<void> getProductList() async {
    emit(ProductLoading());

    try {
      final failureOrProductList = await getProductListUsecase.call(NoParams());

      failureOrProductList.fold(
        (l) {
          print("ERRO ERRO");
        },
        (r) {
          print(r);
          return emit(ProductSuccess(productList: r));
        },
      );
    } catch (e) {
      return emit(ProductError());
    }
  }
}
