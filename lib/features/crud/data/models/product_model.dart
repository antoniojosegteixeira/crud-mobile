import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.clientName,
    required super.orderDate,
    required super.deliveryDate,
    required super.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final id = json["id"].toString();
    final clientName = json["clientName"];
    final orderDate = json["orderDate"];
    final deliveryDate = json["deliveryDate"];
    final status = json["status"];

    final pr = ProductModel(
      id: id,
      clientName: clientName as String,
      orderDate: orderDate as String,
      deliveryDate: deliveryDate as String,
      status: status as String,
    );

    return pr;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientName": clientName,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,
        "status": status,
      };
}
