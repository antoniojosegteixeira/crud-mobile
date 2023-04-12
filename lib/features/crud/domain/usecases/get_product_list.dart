import 'package:dartz/dartz.dart';
import 'package:softsul_mobile/core/error/failures.dart';

import 'package:softsul_mobile/core/usecase/usecase.dart';
import 'package:softsul_mobile/features/crud/data/repositories/product_repository_impl.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';

class GetProductList implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepositoryImpl productRepository;

  GetProductList({
    required this.productRepository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams noParams) async {
    return await productRepository.getProductList();
  }
}
