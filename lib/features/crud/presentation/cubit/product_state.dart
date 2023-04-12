part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState({this.message});

  final String? message;

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  const ProductError({required super.message});
}

class ProductSuccess extends ProductState {
  const ProductSuccess({required this.productList});

  final List<ProductEntity> productList;
}

class DeleteProductSuccess extends ProductState {}

class DeleteProductError extends ProductState {
  const DeleteProductError({required super.message});
}

class EditProductSuccess extends ProductState {}

class EditProductError extends ProductState {
  const EditProductError({required super.message});
}

class AddProductSuccess extends ProductState {}

class AddProductError extends ProductState {
  const AddProductError({required super.message});
}
