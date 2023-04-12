import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/status_radio.dart';

class CrudForm extends StatefulWidget {
  @override
  CrudFormState createState() => CrudFormState();
}

class CrudFormState extends State<CrudForm> {
  final _formKey = GlobalKey<FormState>();

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
  }

  handleSubmitForm() {
    print('$clientName $orderDate $deliveryDate $status');
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
                  lastDate: DateTime(2100),
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
                  firstDate: DateTime(2000),
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
