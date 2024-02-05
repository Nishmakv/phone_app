// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
    List<Product> products;
    int? total;
    int? skip;
    int? limit;

    ProductList({
        required this.products,
         this.total,
         this.skip,
         this.limit,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int? id;
    String? title;
    String? description;
    int? price;
    double? discountPercentage;
    double? rating;
    int? stock;
    String? brand;
    Category? category;
    String? thumbnail;
    List<String>? images;

    Product({
         this.id,
         this.title,
         this.description,
         this.price,
         this.discountPercentage,
         this.rating,
         this.stock,
         this.brand,
         this.category,
         this.thumbnail,
         this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: categoryValues.map[json["category"]]!,
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": categoryValues.reverse[category],
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images!.map((x) => x)),
    };
}

enum Category {
    FRAGRANCES,
    LAPTOPS
}

final categoryValues = EnumValues({
    "fragrances": Category.FRAGRANCES,
    "laptops": Category.LAPTOPS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
