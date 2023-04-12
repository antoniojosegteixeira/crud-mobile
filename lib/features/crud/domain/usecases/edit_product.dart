import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softsul_mobile/core/error/failures.dart';

import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/data/repositories/product_repository_impl.dart';

class AddNewProduct implements UseCase<bool, EditProductParams> {
  final ProductRepositoryImpl productRepository;

  AddNewProduct({
    required this.productRepository,
  });

  @override
  Future<Either<Failure, bool>> call(EditProductParams params) async {
    return await productRepository.editProduct(
      id: params.id,
      clientName: params.clientName,
      orderDate: params.orderDate,
      deliveryDate: params.deliveryDate,
      status: params.status,
    );
  }
}

class EditProductParams extends Equatable {
  const EditProductParams({
    required this.id,
    required this.clientName,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
  });
  final String id;
  final String clientName;
  final String orderDate;
  final String deliveryDate;
  final String status;

  @override
  List<Object> get props => [
        id,
        clientName,
        orderDate,
        deliveryDate,
        status,
      ];
}
