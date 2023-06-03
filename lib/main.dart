import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:take_home_test/providers/cart.dart';
import 'package:take_home_test/providers/category.dart';
import 'package:take_home_test/providers/orders.dart';
import 'package:take_home_test/providers/product.dart';
import 'package:take_home_test/providers/reviews.dart';
import 'package:take_home_test/providers/stores.dart';
import 'package:take_home_test/resources/theme_manager.dart';
import 'package:take_home_test/views/home_screen.dart';
import 'package:take_home_test/views/main_screen.dart';
import 'constants/color.dart';
import 'controllers/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: accentColor,
          statusBarBrightness: Brightness.dark),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Reviews()),
        ChangeNotifierProvider(create: (context) => Stores()),
        ChangeNotifierProvider(create: (context) => Categories()),
        ChangeNotifierProvider(create: (context) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(),
        title: 'Test Store',
        home: const MainScreen(),
        routes: routes,
      ),
    );
  }
}
