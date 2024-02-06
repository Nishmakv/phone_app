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
                    childAspectRatio: 0.80,
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 50, // Spacing between columns
                    mainAxisSpacing: 1 // Spacing between rows
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
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.network(data.thumbnail, fit: BoxFit.fill),
                            Text(
                              data.title,
                              style: TextStyle(
                                fontSize: h / 50,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '₹${data.price.toString()}',
                              style: TextStyle(
                                fontSize: h / 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
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
