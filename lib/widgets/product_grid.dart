import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phone_app/models/product_model.dart';
import 'package:phone_app/screens/product_details.dart';

// ignore: must_be_immutable
class ProductGridWidget extends StatefulWidget {
  List<Product> products = [];
  final Function(ScrollController) onScrollControllerCreated;
  ProductGridWidget({
    Key? key,
    required this.products,
    required this.onScrollControllerCreated,
  }) : super(key: key);

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // controller.addListener(() {
    // if (controller.position.maxScrollExtent == controller.offset) {
    //   print('llllllllllll');
    // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: widget.onScrollControllerCreated(controller),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: 0.80,
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 5, // Spacing between columns
                  mainAxisSpacing: 1 // Spacing between rows
                  ),
              itemCount: widget.products.length + 1,
              itemBuilder: (context, index) {
                if (index < widget.products.length) {
                  final data = widget.products[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailScreen(
                                  id: widget.products[index].id);
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            child: Image.network(data.thumbnail,
                                fit: BoxFit.contain),
                          ),
                          Text(
                            data.title,
                            style: TextStyle(
                              fontSize: h / 60,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '₹${data.price.toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: h / 45),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
