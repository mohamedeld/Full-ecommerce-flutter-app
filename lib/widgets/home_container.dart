import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/widgets/home_page_carousel.dart';
import 'package:ecommerce/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HomePageCarousel(state: state),
                const SizedBox(height: 24),
                ProductList(state: state),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message, style: textTheme.labelLarge),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
