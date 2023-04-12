import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softsul_mobile/core/error/failures.dart';

import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/data/repositories/product_repository_impl.dart';

class AddNewProduct implements UseCase<bool, AddNewProductParams> {
  final ProductRepositoryImpl productRepository;

  AddNewProduct({
    required this.productRepository,
  });

  @override
  Future<Either<Failure, bool>> call(AddNewProductParams params) async {
    return await productRepository.addNewProduct(
      clientName: params.clientName,
      orderDate: params.orderDate,
      deliveryDate: params.deliveryDate,
      status: params.status,
    );
  }
}

class AddNewProductParams extends Equatable {
  const AddNewProductParams({
    required this.clientName,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
  });

  final String clientName;
  final String orderDate;
  final String deliveryDate;
  final String status;

  @override
  List<Object> get props => [
        clientName,
        orderDate,
        deliveryDate,
        status,
      ];
}
