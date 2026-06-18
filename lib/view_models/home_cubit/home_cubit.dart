import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/home_carousel_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(Duration(seconds: 2), () {
      emit(
        HomeLoaded(
          carouselItems: dummyHomeCarouselItems,
          products: dummyProducts,
        ),
      );
    });
  }
}
