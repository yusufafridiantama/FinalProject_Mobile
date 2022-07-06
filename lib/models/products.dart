class Products {
  late int id;
  late String title;
  late String description;
  late int price;
  late double discount;
  late double rating;
  late int stock;
  late String brand;
  late String category;
  late String thumbnail;
  late List imageUrl;
  late bool isPopular;
  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.imageUrl,
    this.isPopular = false,
  });
  Products.fromJson(json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discount = json['discountPercentage'];
    rating = json['rating'].toDouble();
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    imageUrl = json['images'];
  }
}
