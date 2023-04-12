import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:softsul_mobile/features/crud/data/datasources/product_remote_datasource.dart';
import 'package:softsul_mobile/features/crud/data/repositories/product_repository_impl.dart';
import 'package:softsul_mobile/features/crud/domain/usecases/get_product_list.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature Blocs
  sl.registerFactory(
    () => ProductCubit(getProductListUsecase: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ProductRepositoryImpl>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetProductList(
      productRepository: sl(),
    ),
  );

  // Data sources:
  sl.registerLazySingleton<ProductRemoteDataSourceImpl>(
    () => ProductRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  // External
  // Cache, client, etc
  sl.registerLazySingleton(() => http.Client());
}
