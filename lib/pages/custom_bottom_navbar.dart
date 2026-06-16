import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/favorite_page.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: FavoritePage(),
          item: ItemConfig(icon: Icon(Icons.favorite), title: "Favorites"),
        ),
        PersistentTabConfig(
          screen: CartPage(),
          item: ItemConfig(icon: Icon(Icons.shopping_cart), title: "Cart"),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(icon: Icon(Icons.account_box), title: "Account"),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
