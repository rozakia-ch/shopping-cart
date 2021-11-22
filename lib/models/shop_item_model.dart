class ShopItemModel {
  String imageUrl;
  String? thumbnail;
  String title;
  double price;
  int quantity;

  ShopItemModel({
    required this.imageUrl,
    this.thumbnail,
    required this.price,
    required this.quantity,
    required this.title,
  });
}
