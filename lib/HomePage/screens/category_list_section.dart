import 'dart:convert';

import 'package:conagora/Logic/category_sync_bloc.dart';
import 'package:conagora/data/category_list_data.dart';
//import 'package:conagora/HomePage/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../data/menu_repository.dart';
import '../../widgets/card_widget.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFFEFB32C);
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
                      final menuData = snapshot.data;
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
                            return menuBuilder();
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
  Widget menuBuilder() {
    return ListView.builder(
      controller: _bloc.scrollController,
      itemCount: _bloc.menu.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        final item = _bloc.items[index];
        final myMenu = _bloc.menu[index];
        //final myDish = myMenu.dishes![index];

        if (item.isCategory) {
          /**Category section */
          return _CategoryItem(item.category!);
        } else {
          /**ListView section */
          return _ProductItem(item.dish!);
          //for testing purposes
          //return const Text("data");
        }
      },
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
        color: selected ? _blueColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.categoryName!,
            style: TextStyle(
                color: selected ? Colors.white : _blueColor,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
        ),
      ),
    );
  }
}

/**Category section */
class _CategoryItem extends StatelessWidget {
  //const _RappiCategoryItem({Key? key}) : super(key: key);
  const _CategoryItem(this.category);
  final MenuModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        height: categoryHeight,
        alignment: Alignment.centerLeft,
        child: Text(
          category.categoryName!,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _blueColor,
            ),
          ),
        ));
  }
}

/**Listview section */
class _ProductItem extends StatelessWidget {
  const _ProductItem(this.product);
  final Dish product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
            elevation: 6,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 100,
                    height: 100,
                    //fit: BoxFit.contain,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/plat1.png"),
                        ),
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    // child: Image.asset(
                    //   product.image,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.dishName!,
                        style: const TextStyle(
                            color: _blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        product.dishDescription!,
                        maxLines: 2,
                        style: const TextStyle(
                            color: _blueColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${product.dishPrice.toString()} Dt",
                        style: const TextStyle(
                            color: _greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
