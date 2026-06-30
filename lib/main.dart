import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/pages/custom_bottom_navbar.dart';
import 'package:ecommerce/view_models/auth/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/utils/app_router.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove splash screen after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });

    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.authCheck();
        return cubit;
      },
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return BlocBuilder<AuthCubit, AuthState>(
            bloc: cubit,
            buildWhen: (previous, current) =>
                current is AuthDone || current is AuthInitial,
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),
                initialRoute: state is AuthDone
                    ? AppRoutes.homeRoute
                    : AppRoutes.loginRoute,
                home: const CustomBottomNavbar(),
                onGenerateRoute: AppRouter.onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
