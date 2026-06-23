import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/widgets/tabbar_container.dart';
import 'package:ecommerce/widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 32),
              Expanded(child: TabbarContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
