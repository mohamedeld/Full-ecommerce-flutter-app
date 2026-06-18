import 'package:ecommerce/widgets/categories_tab.dart';
import 'package:ecommerce/widgets/home_container.dart';

import 'package:flutter/material.dart';

class TabbarContainer extends StatefulWidget {
  const TabbarContainer({super.key});

  @override
  State<TabbarContainer> createState() => _TabbarContainerState();
}

class _TabbarContainerState extends State<TabbarContainer>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Category'),
          ],
        ),
        SizedBox(height: 32),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [HomeContainer(), CategoriesTab()],
          ),
        ),
      ],
    );
  }
}
