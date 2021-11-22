import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/models/shop_item_model.dart';
import 'package:shopping_cart/ui/shopping_cart.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.shopItem}) : super(key: key);

  final ShopItemModel shopItem;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<ShopItemModel> cartItems = [];

  bool _itemselected = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {},
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ItemAddingCartState) {
            cartItems = state.cartItems;
          }

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "E-com",
              ),
              elevation: 0,
              backgroundColor: Colors.orange,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(widget.shopItem.imageUrl),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.shopItem.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '\$${widget.shopItem.price}',
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Quantity',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (widget.shopItem.quantity > 0) {
                                      setState(() {
                                        widget.shopItem.quantity--;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Text(
                                      widget.shopItem.quantity.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      widget.shopItem.quantity++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            color: Colors.pink,
                            onPressed: () {
                              if (_itemselected == false) {
                                ShopItemModel cartItem = ShopItemModel(
                                  imageUrl: widget.shopItem.imageUrl,
                                  title: widget.shopItem.title,
                                  price: widget.shopItem.price,
                                  quantity: widget.shopItem.quantity,
                                );

                                cartItems.add(cartItem);

                                BlocProvider.of<CartBloc>(context).add(
                                    ItemAddedCartEvent(cartItems: cartItems));

                                setState(() {
                                  _itemselected = true;
                                });
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<CartBloc>(context),
                                      child: const ShoppingCart(),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              _itemselected ? 'Go to Cart' : 'Add to Cart',
                              style: const TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
