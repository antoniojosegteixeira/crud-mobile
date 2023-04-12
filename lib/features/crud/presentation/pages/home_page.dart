import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softsul_mobile/features/crud/domain/entities/product_entity.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/form_modal.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/list_card.dart';
import 'package:softsul_mobile/injection_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ProductCubit cubit;

  List<ProductEntity> productList = [];

  @override
  void initState() {
    cubit = sl<ProductCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (_) => cubit..getProductList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Softsul"),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductSuccess) {
              setState(() {
                productList = state.productList;
              });
            }

            if (state is DeleteProductError ||
                state is EditProductError ||
                state is AddProductError ||
                state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message ??
                      "Erro. Por favor tente novamente mais tarde."),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductSuccess) {
              return SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListCard(
                      item: productList[index],
                    );
                  },
                ),
              );
            } else if (state is ProductError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openFormModal(context: context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
