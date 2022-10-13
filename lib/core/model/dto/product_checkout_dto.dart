class ProductCheckoutDTO {
  String id;
  String name;
  double price;
  String measure;
  bool isOrganic;
  int quantityPerSale;
  int quantity;
  String photoUrl;

  ProductCheckoutDTO({
    required this.id,
    required this.name,
    required this.measure,
    required this.quantityPerSale,
    required this.photoUrl,
    required this.isOrganic,
    required this.price,
    this.quantity = 0,
  });
}
