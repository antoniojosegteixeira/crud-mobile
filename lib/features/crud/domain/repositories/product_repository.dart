import 'package:dartz/dartz.dart';
import 'package:softsul_mobile/core/error/failures.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();

  Future<Either<Failure, bool>> addNewProduct({
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  });

  Future<Either<Failure, bool>> editProduct({
    required String id,
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  });

  Future<Either<Failure, bool>> deleteProduct({
    required String id,
  });
}
