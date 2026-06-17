import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/home_carousel_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePageCarousel extends StatefulWidget {
  const HomePageCarousel({super.key});

  @override
  State<HomePageCarousel> createState() => _HomePageCarouselState();
}

class _HomePageCarouselState extends State<HomePageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterCarousel.builder(
          options: FlutterCarouselOptions(
            height: 200.0,
            showIndicator: false,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            padEnds: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: dummyHomeCarouselItems.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: dummyHomeCarouselItems[itemIndex].imgUrl,
                        placeholder: (context, url) => SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dummyHomeCarouselItems.length, (index) {
            final isActive = index == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 10 : 8,
              height: isActive ? 10 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
