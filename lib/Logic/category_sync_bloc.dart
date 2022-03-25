import 'package:conagora/data/category_list_data.dart';
import 'package:conagora/data/menu_repository.dart';
import 'package:conagora/theme/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CategorySyncBLoC with ChangeNotifier {
  MenuRepository repo = MenuRepository();
  List<TabCategory> tabs = [];
  List<ListItem> items = [];
  List<MenuModel> menu = [];

  late TabController tabController;

  ScrollController scrollController = ScrollController();

  void onCategorySelected(int index) {
    final selected = tabs[index];

    for (int i = 0; i < tabs.length; i++) {
      final condition =
          selected.category.categoryName == tabs[i].category.categoryName;

      tabs[i] = tabs[i].copyWith(condition);
      //}
    }
    notifyListeners();

    scrollController.animateTo(selected.offsetFrom,
        duration: const Duration(microseconds: 500), curve: Curves.bounceOut);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void init(TickerProvider ticker) async {
    menu = await repo.fetchMenu();
    tabController = TabController(length: menu.length, vsync: ticker);
    double offsetForm = 0.0;
    double offsetTo = 0.0;
    for (int i = 0; i < menu.length; i++) {
      final category = menu[i];
      if (i > 0) {
        offsetForm += menu[i - 1].dishes!.length * productHeight;
      }
      if (i < menu.length - 1) {
        offsetTo = offsetForm + menu[i + 1].dishes!.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }
      tabs.add(
        TabCategory(
          category: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetForm,
          offsetTo: offsetTo,
        ),
      );

      items.add(ListItem(category: category));
      for (int j = 0; j < category.dishes!.length; j++) {
        final dish = category.dishes![j];
        items.add(ListItem(dish: dish));
      }
    }
    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    for (int i = 0; i < tabs.length; i++) {
      final tab = tabs[i];
      if (scrollController.offset >= tab.offsetFrom &&
          scrollController.offset <= tab.offsetTo &&
          !tab.selected) {
        onCategorySelected(i);
        break;
      }
    }
  }
}
//}

class TabCategory {
  const TabCategory({
    required this.category,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  TabCategory copyWith(bool selected) => TabCategory(
      category: category,
      selected: selected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);

  final MenuModel category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;
}

class ListItem {
  final MenuModel? category;
  final Dish? dish;

  const ListItem({this.category, this.dish});
  bool get isCategory => category != null;
}
