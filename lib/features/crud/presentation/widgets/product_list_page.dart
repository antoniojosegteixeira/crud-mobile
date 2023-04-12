import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
        if (state is ProductError) {
          return const Scaffold(
            body: Text('Error'),
          );
        }
        if (state is ProductSuccess) {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
