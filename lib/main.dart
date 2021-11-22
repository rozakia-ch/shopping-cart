import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/repositories/shop_repository.dart';
import 'package:shopping_cart/ui/product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider(
    create: (context) => CartBloc(ShopRepository()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductPage(),
    );
  }
}
