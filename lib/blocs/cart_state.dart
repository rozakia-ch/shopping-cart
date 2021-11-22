part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CartPageLoadedState extends CartState {
  ShopDataModel shopData;
  ShopDataModel cartData;

  CartPageLoadedState({required this.cartData, required this.shopData});

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemAddingCartState extends CartState {
  ShopDataModel? cartData;
  List<ShopItemModel> cartItems;

  ItemAddingCartState({this.cartData, required this.cartItems});

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemAddedCartState extends CartState {
  List<ShopItemModel> cartItems;

  ItemAddedCartState({required this.cartItems});

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemDeletingCartState extends CartState {
  List<ShopItemModel> cartItems;

  ItemDeletingCartState({required this.cartItems});

  @override
  List<Object?> get props => [];
}
