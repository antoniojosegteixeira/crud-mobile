import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/status_radio.dart';
import 'package:softsul_mobile/injection_container.dart';

class CrudForm extends StatefulWidget {
  const CrudForm({
    super.key,
    this.product,
    this.callback,
  });

  final ProductEntity? product;
  final Function? callback;
  @override
  CrudFormState createState() => CrudFormState();
}

class CrudFormState extends State<CrudForm> {
  final _formKey = GlobalKey<FormState>();

  final cubit = sl<ProductCubit>();

  String? id;
  String? clientName;
  DateTime? orderDate;
  DateTime? deliveryDate;
  String status = "pendente";

  late TextEditingController clientNameController = TextEditingController();
  late TextEditingController orderDateController = TextEditingController();
  late TextEditingController deliveryDateController = TextEditingController();
  late TextEditingController statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      clientNameController.text = widget.product?.clientName as String;
      orderDateController.text = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(widget.product?.orderDate as String));
      deliveryDateController.text = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(widget.product?.deliveryDate as String));
      statusController.text = widget.product?.status as String;

      setState(() {
        id = widget.product?.id as String;
        clientName = widget.product?.clientName as String;
        orderDate = DateTime.parse(widget.product?.orderDate as String);
        deliveryDate = DateTime.parse(widget.product?.deliveryDate as String);
        status = widget.product?.status as String;
      });
    }
  }

  handleSubmitForm() {
    if (widget.product != null) {
      cubit.editProduct(
        id: id as String,
        clientName: clientName as String,
        orderDate: orderDate as DateTime,
        deliveryDate: deliveryDate as DateTime,
        status: status,
      );
    } else {
      cubit.addNewProduct(
        clientName: clientName as String,
        orderDate: orderDate as DateTime,
        deliveryDate: deliveryDate as DateTime,
        status: status,
      );
    }

    if (widget.callback != null) {
      widget.callback!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome do Cliente'),
              controller: clientNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onSaved: (value) {
                clientName = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Data do Pedido'),
              controller: orderDateController,
              validator: (value) {
                if (orderDate == null) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onTap: () async {
                final orderDateCopy = await showDatePicker(
                  context: context,
                  initialDate: orderDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );

                if (orderDateCopy != null) {
                  orderDateController.text =
                      DateFormat('dd/MM/yyyy').format(orderDateCopy);
                  setState(() {
                    orderDate = orderDateCopy;
                  });
                }
              },
            ),
            TextFormField(
              enabled: orderDate != null,
              decoration: const InputDecoration(labelText: 'Data de Entrega'),
              controller: deliveryDateController,
              validator: (value) {
                if (deliveryDate == null) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onTap: () async {
                final deliveryDateCopy = await showDatePicker(
                  context: context,
                  initialDate: deliveryDate ?? DateTime.now(),
                  firstDate: orderDate as DateTime,
                  lastDate: DateTime(2100),
                );

                if (deliveryDateCopy is DateTime) {
                  deliveryDateController.text =
                      DateFormat('dd/MM/yyyy').format(deliveryDateCopy);
                  setState(() {
                    deliveryDate = deliveryDateCopy;
                  });
                }
              },
            ),
            const SizedBox(height: 10.0),
            StatusRadio(
              status: status,
              setStatus: (newStatus) {
                setState(() {
                  status = newStatus;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  handleSubmitForm();
                }
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
