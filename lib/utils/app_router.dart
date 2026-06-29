import 'package:ecommerce/pages/add_new_card.dart';
import 'package:ecommerce/pages/choose_location.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/register_page.dart';
import 'package:ecommerce/view_models/auth/auth_cubit.dart';
import 'package:ecommerce/view_models/card_payment/add_new_card_cubit.dart';
import 'package:ecommerce/view_models/choose_location/choose_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/pages/checkout_page.dart';
import 'package:ecommerce/pages/custom_bottom_navbar.dart';
import 'package:ecommerce/pages/product_details_page.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/product_details/product_details_cubit.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginPage(),
          ),
          settings: settings,
        );
      case AppRoutes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterPage(),
          ),
          settings: settings,
        );
      case AppRoutes.addCardRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddNewCardCubit(),
            child: const AddNewCard(),
          ),
          settings: settings,
        );
      case AppRoutes.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
          settings: settings,
        );
      case AppRoutes.chooseLocation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ChooseLocationCubit();
              cubit.fetchLocations();
              return cubit;
            },
            child: const ChooseLocation(),
          ),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
        final String? productId = settings.arguments as String?;
        if (productId == null) {
          return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('Missing product ID'))),
          );
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductDetailsCubit()..getProductDetails(productId),
            child: ProductDetailsPage(productId: productId),
          ),
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
