import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/models/product_model.dart';
import 'package:phone_app/product_detail/bloc/product_detail_bloc.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
  int id;
  ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? productDetailModel;

  @override
  void initState() {
    context.read<ProductDetailBloc>().add(Details(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return BlocListener<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if (state is Success) {
          productDetailModel = state.productDetailModel;
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (productDetailModel != null &&
                    productDetailModel!.images.isNotEmpty)
                  SizedBox(
                    height: h / 4,
                    child: Stack(
                      children: [
                        Swiper(
                          pagination: const SwiperPagination(),
                          itemCount: productDetailModel!.images.length,
                          itemWidth: w / 1.1,
                          layout: SwiperLayout.STACK,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  productDetailModel!.images[index],
                                  fit: BoxFit.fill),
                            );
                          },
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productDetailModel?.title ?? "",
                      style: TextStyle(
                        fontSize: h / 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(
                          productDetailModel?.rating.toString() ?? '',
                          style: TextStyle(
                            fontSize: h / 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(productDetailModel?.category.toString() ?? ''),
                Text('(${productDetailModel?.brand ?? ''})'),
                const SizedBox(height: 10),
                Text(
                  '₹${productDetailModel?.price.toString() ?? ''}',
                  style: TextStyle(
                    fontSize: h / 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  productDetailModel?.description ?? '',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Discount Percentage: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      productDetailModel?.discountPercentage.toString() ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Stock: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      productDetailModel?.stock.toString() ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
