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
    return await productRepository.deleteProduct(
      id: params.id,
    );
  }
}

class EditProductParams extends Equatable {
  const EditProductParams({
    required this.id,
  });
  final String id;

  @override
  List<Object> get props => [
        id,
      ];
}
