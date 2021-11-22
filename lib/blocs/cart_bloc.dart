import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/shop_data_model.dart';
import 'package:shopping_cart/models/shop_item_model.dart';
import 'package:shopping_cart/repositories/shop_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ShopRepository _shopRepository;
  CartBloc(this._shopRepository) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      add(CartPageInitializedEvent());
      if (event is CartPageInitializedEvent) {
        ShopDataModel shopData = await _shopRepository.getShopItems();
        ShopDataModel cartData = await _shopRepository.geCartItems();
        emit(CartPageLoadedState(shopData: shopData, cartData: cartData));
      }
      if (event is ItemAddingCartEvent) {
        emit(ItemAddingCartState(cartItems: event.cartItems));
      }
      if (event is ItemAddedCartEvent) {
        emit(ItemAddedCartState(cartItems: event.cartItems));
      }
      if (event is ItemDeleteCartEvent) {
        emit(ItemDeletingCartState(cartItems: event.cartItems));
      }
    });
  }
}
