import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/product/screens/detail_product_screen.dart';
import 'package:go_router_example/features/product/screens/product_list_screen.dart';

abstract final class ProductRoutes {
  static const String _productDetailPath = '/product/detail';
  static const String _productListPath = '/product/list';

  static const String productDetailScreen = 'productDetail_screen';
  static const String productListScreen = 'productList_screen';

  static final routes = GoRoute(
    path: _productListPath,
    name: productListScreen,
    builder: (context, state) => const ProductListScreen(),
    routes: [
      GoRoute(
        path: _productDetailPath,
        name: productDetailScreen,
        builder: (context, state) => const DetailProductScreen(),
      ),
    ],
  );
}
