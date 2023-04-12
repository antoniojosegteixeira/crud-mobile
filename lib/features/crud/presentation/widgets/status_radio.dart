import 'package:flutter/material.dart';

class StatusRadio extends StatelessWidget {
  const StatusRadio({
    super.key,
    required this.status,
    required this.setStatus,
  });

  final String status;
  final Function setStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'entregue',
              groupValue: status,
              onChanged: (value) {
                setStatus(value);
              },
            ),
            const Text('Entregue'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'cancelado',
              groupValue: status,
              onChanged: (value) {
                setStatus(value);
              },
            ),
            const Text('Cancelado'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'pendente',
              groupValue: status,
              onChanged: (value) {
                setStatus(value);
              },
            ),
            const Text('Pendente'),
          ],
        ),
      ],
    );
  }
}
