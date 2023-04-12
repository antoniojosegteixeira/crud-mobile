import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/add_new_product.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/delete_product.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/edit_product.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/get_product_list.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required this.getProductListUsecase,
    required this.deleteProductUsecase,
    required this.editProductUsecase,
    required this.addNewProductUsecase,
  }) : super(ProductLoading());

  GetProductList getProductListUsecase;
  DeleteProduct deleteProductUsecase;
  EditProduct editProductUsecase;
  AddNewProduct addNewProductUsecase;

  Future<void> getProductList() async {
    emit(ProductLoading());

    try {
      final failureOrProductList = await getProductListUsecase.call(NoParams());
      failureOrProductList.fold(
        (l) {
          return emit(
            const ProductError(message: 'Erro ao buscar produtos'),
          );
        },
        (r) {
          return emit(ProductSuccess(productList: r));
        },
      );
    } catch (e) {
      return emit(const ProductError(message: "Erro ao buscar produtos"));
    }
  }

  Future<void> deleteProduct({required String id}) async {
    try {
      final failureOrDelete =
          await deleteProductUsecase.call(DeleteProductParams(id: id));

      failureOrDelete.fold(
        (l) {
          return emit(
              const DeleteProductError(message: 'Erro ao deletar produto'));
        },
        (r) async {
          emit(DeleteProductSuccess());

          await getProductList();
        },
      );
    } catch (e) {
      return emit(const DeleteProductError(message: "Erro ao deletar produto"));
    }
  }

  Future<void> editProduct({
    required String id,
    required String clientName,
    required DateTime orderDate,
    required DateTime deliveryDate,
    required String status,
  }) async {
    try {
      final failureOrEditProduct =
          await editProductUsecase.call(EditProductParams(
        id: id,
        clientName: clientName,
        orderDate: orderDate.toIso8601String(),
        deliveryDate: deliveryDate.toIso8601String(),
        status: status,
      ));

      failureOrEditProduct.fold(
        (l) {
          return emit(
              const EditProductError(message: 'Erro ao editar produto'));
        },
        (r) async {
          emit(EditProductSuccess());
          await getProductList();
        },
      );
    } catch (e) {
      return emit(const EditProductError(message: "Erro ao editar produto"));
    }
  }

  Future<void> addNewProduct({
    required String clientName,
    required DateTime orderDate,
    required DateTime deliveryDate,
    required String status,
  }) async {
    try {
      final failureOrAddNewProduct =
          await addNewProductUsecase.call(AddNewProductParams(
        clientName: clientName,
        orderDate: orderDate.toIso8601String(),
        deliveryDate: deliveryDate.toIso8601String(),
        status: status,
      ));

      failureOrAddNewProduct.fold(
        (l) {
          return emit(
              const AddProductError(message: 'Erro ao adicionar produto'));
        },
        (r) async {
          emit(AddProductSuccess());
          await getProductList();
        },
      );
    } catch (e) {
      return emit(const AddProductError(message: "Erro ao adicionar produto"));
    }
  }
}
