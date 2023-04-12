import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softsul_mobile/features/crud/presentation/cubit/product_cubit.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/crud_form.dart';
import 'package:softsul_mobile/features/crud/presentation/widgets/list_card.dart';
import 'package:softsul_mobile/injection_container.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final cubit = sl<ProductCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (_) => cubit..getProductList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Softsul"),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductSuccess) {
              return SizedBox(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 450,
                      child: CrudForm(),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListCard(
                          item: state.productList[index],
                        );
                      },
                    ),
                  ],
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
      ),
    );
  }
}
