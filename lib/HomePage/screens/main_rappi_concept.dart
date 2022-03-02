import 'package:conagora/HomePage/screens/rappi_bloc.dart';
import 'package:conagora/HomePage/screens/rappi_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFF2BBEBA);
const categoryHeight = 55.0;
const productHeight = 100.0;

class MainRappiConcept extends StatelessWidget {
  const MainRappiConcept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: _RappiConcept());
  }
}

class _RappiConcept extends StatefulWidget {
  const _RappiConcept({Key? key}) : super(key: key);

  @override
  State<_RappiConcept> createState() => _RappiConceptState();
}

class _RappiConceptState extends State<_RappiConcept>
    with SingleTickerProviderStateMixin {
  final _bloc = RappiBLoC();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Accueil",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _blueColor,
                          ),
                        ),
                      ),
                      //Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                        child: const Text('Se connecter',
                            style: TextStyle(color: _greenColor)),
                      )
                    ],
                  ),
                ),
              ),

              /**
               ************************************************************
               * ****************************************************** /**
               * /             --------------------------
               * *********** //TAB BAR FOR CATEGORIES//**************** 
                            ---------------------------
               * *******************************************************/** 
               ************************************************************
               */*/

              Container(
                //for test
                //color: Colors.green,
                height: 60,
                child: TabBar(
                  onTap: _bloc.onCategorySelected,
                  controller: _bloc.tabController,
                  isScrollable: true,
                  indicatorWeight: 0.4,
                  tabs: _bloc.tabs.map((e) => _RappiTabWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      if (index.isOdd) {
                        return const _RappiCategoryItem();
                      } else {
                        return const _RappiProductItem();
                      }
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
}

class _RappiTabWidget extends StatelessWidget {
  // const _RappiTabWidget({Key? key}) : super(key: key);
  const _RappiTabWidget(this.tabCategory);
  final RappiTabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: TextStyle(
                color: _blueColor, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }
}

class _RappiCategoryItem extends StatelessWidget {
  const _RappiCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: categoryHeight,
        alignment: Alignment.centerLeft,
        child: Text(
          "Categorie",
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

class _RappiProductItem extends StatelessWidget {
  const _RappiProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: const Text("Product"),
    );
  }
}

