class PopularProduct {
  late int id;
  late String name;
  late String imageUrl;
  late bool isPopular;
  PopularProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isPopular = false,
  });
}
