import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/models/shop_item_model.dart';
import 'product_detail.dart';
import 'product_item.dart';
import 'shopping_cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool loadingData = true;
  List<ShopItemModel> _cartItems = [];
  late List<ShopItemModel> shopItems;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartInitial) {
          loadingData = true;
        } else if (state is CartPageLoadedState) {
          shopItems = state.shopData.shopitems;
          _cartItems = state.cartData.shopitems;
          loadingData = false;
        }
        if (state is ItemAddedCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("E-commmerce"),
              elevation: 0,
              backgroundColor: Colors.orange,
            ),
            backgroundColor: const Color(0xFFEEEEEE),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CartBloc>(context),
                      child: const ShoppingCart(),
                    ),
                  ),
                );
              },
              child: Text(
                _cartItems.length.toString(),
              ),
            ),
            body: loadingData
                ? const Center(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemCount: shopItems.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ProductItem(
                                        addToCart: () {
                                          setState(() {
                                            _cartItems.add(shopItems[index]);
                                          });
                                        },
                                        // productImage:
                                        //     shopItems[index].imageUrl,
                                        productImage:
                                            shopItems[index].thumbnail!,
                                        price: shopItems[index].price,
                                        title: shopItems[index].title,
                                        press: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      BlocProvider.value(
                                                          value: BlocProvider
                                                              .of<CartBloc>(
                                                                  context)
                                                            ..add(ItemAddingCartEvent(
                                                                cartItems:
                                                                    _cartItems)),
                                                          child: ProductDetail(
                                                            shopItem: shopItems[
                                                                index],
                                                          ))));
                                        },
                                      );
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
