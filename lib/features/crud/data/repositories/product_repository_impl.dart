import 'package:dartz/dartz.dart';
import 'package:softsul_mobile/core/error/failures.dart';
import 'package:softsul_mobile/features/crud/data/datasources/product_remote_datasource.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({
    required this.remoteDataSource,
  });
  final ProductRemoteDataSourceImpl remoteDataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() async {
    try {
      final List<ProductEntity> response =
          await remoteDataSource.getProductList();
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNewProduct({
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  }) async {
    try {
      final bool response = await remoteDataSource.addNewProduct(
        clientName: clientName,
        orderDate: orderDate,
        deliveryDate: deliveryDate,
        status: status,
      );
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> editProduct({
    required String id,
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  }) async {
    try {
      final bool response = await remoteDataSource.editProduct(
        id: id,
        clientName: clientName,
        orderDate: orderDate,
        deliveryDate: deliveryDate,
        status: status,
      );
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct({
    required String id,
  }) async {
    try {
      final bool response = await remoteDataSource.deleteProduct(
        id: id,
      );
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
