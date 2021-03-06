import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';

import 'package:shopping_cart/models/shop_item_model.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  late List<ShopItemModel> cartItems;
  double totalAmount = 0;
  void calculateTotalAmount(List<ShopItemModel> list) {
    double res = 0;

    for (var element in list) {
      res = res + element.price * element.quantity;
    }
    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        if (state is CartPageLoadedState) {
          cartItems = state.cartData.shopitems;
          calculateTotalAmount(cartItems);
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }

        if (state is ItemAddingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        return Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            backgroundColor: const Color(0XFFF8F5F0),
            title: const Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.purple),
            ),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            height: 68,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 8,
                    color: const Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 3,
                    color: const Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 4,
                    color: const Color(0xFF000000).withOpacity(0.14),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text('Total Amount'),
                  Text('\$${totalAmount.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),
          body: cartItems.isEmpty
              ? const Center(child: Text('Your Cart is Empty'))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    cartItems[index].imageUrl,
                                    height: 64,
                                    width: 64,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(cartItems[index].title),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        if (state is CartPageLoadedState) {
                                          state.cartData.shopitems
                                              .removeAt(index);
                                          calculateTotalAmount(cartItems);
                                          BlocProvider.of<CartBloc>(context)
                                              .add(ItemDeleteCartEvent(
                                                  cartItems: state
                                                      .cartData.shopitems));
                                        } else if (state
                                            is ItemAddedCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<CartBloc>(context)
                                              .add(ItemDeleteCartEvent(
                                                  cartItems: state.cartItems));
                                        } else if (state
                                            is ItemDeletingCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<CartBloc>(context)
                                              .add(ItemDeleteCartEvent(
                                                  cartItems: state.cartItems));
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (cartItems[index].quantity > 0) {
                                        setState(() {
                                          calculateTotalAmount(cartItems);
                                          cartItems[index].quantity--;
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
                                        cartItems[index].quantity.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        calculateTotalAmount(cartItems);
                                        cartItems[index].quantity++;
                                      });
                                    },
                                  ),
                                  const Spacer(),
                                  Text(
                                      '\$${cartItems[index].price * cartItems[index].quantity} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
