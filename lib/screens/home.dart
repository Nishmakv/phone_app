import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/bloc/product_list_bloc.dart';
import 'package:phone_app/models/product_model.dart';
import 'package:phone_app/screens/add.dart';
import 'package:phone_app/widgets/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductList? productListModel;
  @override
  void initState() {
    super.initState();
    context.read<ProductListBloc>().add(
          const ProductListEvent.started(skip: 0, limit: 10),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductListBloc, ProductListState>(
      listener: (context, state) {
        if (state is Success) {
          print(state.productListModel);
          productListModel = state.productListModel;
          setState(() {});
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is Success) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ProductGridWidget(products: productListModel!.products),
                      ],
                    ),
                  ),
                );
              } else if (state is Failure) {
                return const CircularProgressIndicator();
              } else {
                return const Text('fail');
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddScreen();
                },
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
