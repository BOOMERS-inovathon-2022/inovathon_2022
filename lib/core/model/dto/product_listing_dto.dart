class ProductListingDTO {
  String id;
  String name;
  String photo;
  String measure;
  int quantityPerSale;

  ProductListingDTO({
    required this.id,
    required this.name,
    required this.photo,
    required this.measure,
    required this.quantityPerSale,
  });
}
