import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/form_modal.dart';
import 'package:softsul_mobile/injection_container.dart';

class ListCard extends StatefulWidget {
  const ListCard({Key? key, required this.item}) : super(key: key);

  final ProductEntity item;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  late final ProductCubit cubit;

  @override
  void initState() {
    cubit = sl<ProductCubit>();
    super.initState();
  }

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
                    widget.item.clientName,
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
                        'Id: ${widget.item.id}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Data do Pedido: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.item.orderDate))} ',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Data da Entrega: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.item.deliveryDate))}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Status: ${widget.item.status}',
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
                            openFormModal(
                                context: context, product: widget.item);
                          },
                          child: const Icon(Icons.edit),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cubit.deleteProduct(id: widget.item.id);
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
