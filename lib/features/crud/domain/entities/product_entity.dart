import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String clientName;
  final String orderDate;
  final String deliveryDate;
  final String status;

  const ProductEntity({
    required this.id,
    required this.clientName,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        clientName,
        orderDate,
        deliveryDate,
        status,
      ];
}
