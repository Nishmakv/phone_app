import 'package:flutter/material.dart';
import 'package:phone_app/models/product_model.dart';
import 'package:phone_app/screens/product_details.dart';

// ignore: must_be_immutable
class ProductGridWidget extends StatefulWidget {
  List<Product> products = [];
  ProductGridWidget({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 5, // Spacing between columns
                    mainAxisSpacing: 10 // Spacing between rows
                    ),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
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
                              ));
                        },
                        child:
                            Image.network(data.images![0], fit: BoxFit.fill)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
