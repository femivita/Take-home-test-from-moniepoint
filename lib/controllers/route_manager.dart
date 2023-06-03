import 'package:take_home_test/views/carts/carts.dart';
import 'package:take_home_test/views/orders/orders.dart';
import '../views/main_screen.dart';
import '../views/orders/payment_acknowledgement.dart';
import '../views/product/details.dart';
import '../views/store/details.dart';

class RouteManager {
  static const String splashScreen = "/splash";
  static const String entryScreen = "/entry_screen";
  static const String mainScreen = '/customer_home_screen';
  static const String productDetails = '/product_details_screen';
  static const String storeScreen = '/store_screen';
  static const String cartScreen = '/cart_screen';
  static const String orderScreen = '/order_screen';
  static const String paymentAcknowledgement = '/payment_acknowledgement';
}

final routes = {
  RouteManager.mainScreen: (context) => const MainScreen(),
  RouteManager.productDetails: (context) => const ProductDetails(),
  RouteManager.storeScreen: (context) => const StoreDetails(),
  RouteManager.cartScreen: (context) => const CartScreen(),
  RouteManager.orderScreen: (context) => const OrdersScreen(),
  RouteManager.paymentAcknowledgement: (context) =>
      const PaymentAcknowledgementScreen(),
};
