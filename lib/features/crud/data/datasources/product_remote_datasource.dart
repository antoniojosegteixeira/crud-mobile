import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softsul_mobile/core/error/failures.dart';
import 'package:softsul_mobile/features/crud/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductList();
  Future<bool> addNewProduct({
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  });
  Future<bool> editProduct({
    required String id,
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  });
  Future<bool> deleteProduct({
    required String id,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.client});
  late final http.Client client;

  final url = 'http://192.168.0.49:4000';

  @override
  Future<List<ProductModel>> getProductList() async {
    final response = await client.get(
      Uri.parse(
        url,
      ),
    );

    if (response.statusCode == 200) {
      final listOfProducts = <ProductModel>[];
      final jsonList = jsonDecode(response.body) as List<dynamic>;

      for (final itemJson in jsonList) {
        final result = ProductModel.fromJson(itemJson);
        listOfProducts.add(result);
      }

      return listOfProducts;
    }

    return Future.error(ServerFailure());
  }

  @override
  Future<bool> addNewProduct({
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  }) async {
    final response = await client.post(
      Uri.parse(
        '$url/add-product',
      ),
      body: {
        "clientName": clientName,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,
        "status": status,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return Future.error(ServerFailure());
  }

  @override
  Future<bool> editProduct({
    required String id,
    required String clientName,
    required String orderDate,
    required String deliveryDate,
    required String status,
  }) async {
    final response = await client.put(
      Uri.parse(
        '$url/edit-product',
      ),
      body: {
        "id": id,
        "clientName": clientName,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,
        "status": status,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return Future.error(ServerFailure());
  }

  @override
  Future<bool> deleteProduct({required String id}) async {
    final response = await client.delete(
      Uri.parse(
        '$url/delete-product/$id',
      ),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return Future.error(ServerFailure());
  }
}
