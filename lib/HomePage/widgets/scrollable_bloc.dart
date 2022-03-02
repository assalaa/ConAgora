import 'package:conagora/HomePage/widgets/scrollable_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableBloc with ChangeNotifier {
  List<TabCategory> tabs = [];
  late TabController tabController;

  void init(TickerProvider ticker) {
    tabController =
        TabController(length: scrollableCategories.length, vsync: ticker);
    for (int i = 0; i < scrollableCategories.length; i++) {
      final category = scrollableCategories[i];
      tabs.add(
        TabCategory(category: category, selected: (i == 0)),
      );
    }
  }
}

class TabCategory {
  const TabCategory({required this.category, required this.selected});
  final ScrollableCategory category;
  final bool selected;
}
