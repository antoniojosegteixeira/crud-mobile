import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.item}) : super(key: key);

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.clientName,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6.0),
                      Text(
                        'Id: ${item.id}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Data do Pedido: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(item.orderDate))} ',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Data da Entrega: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(item.deliveryDate))}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Status: ${item.status}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Code to handle edit button press
                          },
                          child: const Icon(Icons.edit),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Code to handle edit button press
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
