class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json["rate"] as num?)?.toDouble() ?? 0.0,
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "count": count,
    };
  }

  @override
  String toString() {
    return 'RatingModel(rate: $rate, count: $count)';
  }
}

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  int qty;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.qty = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating: RatingModel.fromJson(json["rating"] ?? {}),
      qty: 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating.toJson(),
      "qty": qty,
    };
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating, qty: $qty)';
  }
}