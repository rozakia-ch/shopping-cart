part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartPageInitializedEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemAddingCartEvent extends CartEvent {
  List<ShopItemModel> cartItems;

  ItemAddingCartEvent({required this.cartItems});

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemAddedCartEvent extends CartEvent {
  List<ShopItemModel> cartItems;

  ItemAddedCartEvent({required this.cartItems});

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ItemDeleteCartEvent extends CartEvent {
  List<ShopItemModel> cartItems;
  int? index;
  ItemDeleteCartEvent({required this.cartItems, this.index});

  @override
  List<Object?> get props => [];
}
