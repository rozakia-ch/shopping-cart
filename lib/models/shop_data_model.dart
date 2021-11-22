import 'package:shopping_cart/models/shop_item_model.dart';

class ShopDataModel {
  List<ShopItemModel> shopitems;

  ShopDataModel({required this.shopitems});

  void addProduct(ShopItemModel p) {
    shopitems.add(p);
  }

  void removeProduct(ShopItemModel p) {
    shopitems.add(p);
  }
}
