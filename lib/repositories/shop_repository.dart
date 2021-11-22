import 'package:shopping_cart/models/shop_data_model.dart';
import 'package:shopping_cart/models/shop_item_model.dart';

class ShopRepository {
  Future<ShopDataModel> getShopItems() async {
    List<ShopItemModel> shopItems = [
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU",
        price: 22,
        quantity: 1,
        title: 'Shoes',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Sharee',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 30.12,
        quantity: 1,
        title: 'Bat',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU",
        price: 40.12,
        quantity: 1,
        title: 'Jwellery',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU',
      ),
    ];
    return ShopDataModel(shopitems: shopItems);
  }

  Future<ShopDataModel> geCartItems() async {
    List<ShopItemModel> shopItems = [
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU",
        price: 22,
        quantity: 1,
        title: 'Shoes',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Sharee',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 30.12,
        quantity: 1,
        title: 'Bat',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU',
      ),
      ShopItemModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU",
        price: 40.12,
        quantity: 1,
        title: 'Jwellery',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU',
      ),
    ];
    return ShopDataModel(shopitems: shopItems);
  }
}
