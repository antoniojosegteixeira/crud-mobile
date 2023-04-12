import 'package:flutter/material.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/crud_form.dart';

Future<dynamic> openFormModal({
  required BuildContext context,
  ProductEntity? product,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return LayerModal(
          product: product,
        );
      },
    );

class LayerModal extends StatelessWidget {
  const LayerModal({
    super.key,
    this.product,
  });

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      children: [
        SizedBox(
          width: 326,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CrudForm(
                    product: product,
                    callback: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}
