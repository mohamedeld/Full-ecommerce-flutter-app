import 'package:ecommerce/pages/custom_bottom_navbar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/utils/app_router.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Remove splash screen after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.loginRoute,
      home: const CustomBottomNavbar(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
