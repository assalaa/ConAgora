import 'dart:convert';
import 'package:conagora/Logic/category_sync_bloc.dart';
import 'package:conagora/Pages/HomePage/widgets/dish_item.dart';
import 'package:conagora/data/category_list_data.dart';
import 'package:conagora/theme/constants.dart';
//import 'package:conagora/HomePage/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../data/menu_repository.dart';
import '../../../widgets/custom_promotion_card.dart';
import '../widgets/category_item.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const categoryHeight = 55.0;
const productHeight = 110.0;

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: const _TopCategorySection());
  }
}

class _TopCategorySection extends StatefulWidget {
  const _TopCategorySection({Key? key}) : super(key: key);

  @override
  State<_TopCategorySection> createState() => _TopCategorySectionState();
}

class _TopCategorySectionState extends State<_TopCategorySection>
    with TickerProviderStateMixin {
  final _bloc = CategorySyncBLoC();
  final repo = MenuRepository();

  @override
  void initState() {
    _bloc.init(this);
    _bloc.tabController = TabController(vsync: this, length: _bloc.menu.length);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomPromotionCard(),
              /**
                 ************************************************************
                 * ****************************************************** /**
                 * /             --------------------------
                 * *********** //TAB BAR FOR CATEGORIES//****************
                              ---------------------------
                 * *******************************************************/**
                 ************************************************************
                 */*/

              CategoryTab(bloc: _bloc),
              Expanded(
                child: Container(
                  child: FutureBuilder<List<MenuModel>>(
                    future: repo.fetchMenu(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('some error occured!'),
                            );
                          } else {
                            final List<MenuModel> menuData = snapshot.data!;
                            return menuBuilder(menuData);
                          }
                      }
                      //throw (Exception);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//*****************************Menu Builder **************************/
  Widget menuBuilder(List<MenuModel> menuData) {
    List<Widget> items = [];
    for (MenuModel category in menuData) {
      items.add(CategoryItem(category.categoryName!));
      for (Dish dish in category.dishes!) {
        items.add(DishItem(DishItemViewData.fromDish(dish)));
      }
    }
    return ListView(
      controller: _bloc.scrollController,
      children: items,
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required CategorySyncBLoC bloc,
  })  : _bloc = bloc,
        super(key: key);

  final CategorySyncBLoC _bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      //for test
      //color: Colors.green,
      height: 60,
      child: TabBar(
        onTap: _bloc.onCategorySelected,
        controller: _bloc.tabController,
        isScrollable: true,
        indicatorWeight: 0.4,
        tabs: _bloc.tabs.map((e) => _TabWidget(e)).toList(),
      ),
    );
  }
}

class _TabWidget extends StatelessWidget {
  // const _RappiTabWidget({Key? key}) : super(key: key);
  const _TabWidget(this.tabCategory);
  final TabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        color: selected ? blueColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.categoryName!,
            style: TextStyle(
                color: selected ? Colors.white : blueColor,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
        ),
      ),
    );
  }
}
