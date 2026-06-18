import 'package:ecommerce/pages/custom_bottom_navbar.dart';
import 'package:ecommerce/pages/product_details_page.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
