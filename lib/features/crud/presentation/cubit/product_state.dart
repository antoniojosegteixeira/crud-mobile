part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {}

class ProductSuccess extends ProductState {
  const ProductSuccess({required this.productList});

  final List<ProductEntity> productList;
}
