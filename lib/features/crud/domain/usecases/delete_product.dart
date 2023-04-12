import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softsul_mobile/core/error/failures.dart';

import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/data/repositories/product_repository_impl.dart';

class DeleteProduct implements UseCase<bool, DeleteProductParams> {
  final ProductRepositoryImpl productRepository;

  DeleteProduct({
    required this.productRepository,
  });

  @override
  Future<Either<Failure, bool>> call(DeleteProductParams params) async {
    return await productRepository.deleteProduct(
      id: params.id,
    );
  }
}

class DeleteProductParams extends Equatable {
  const DeleteProductParams({
    required this.id,
  });
  final String id;

  @override
  List<Object> get props => [
        id,
      ];
}
