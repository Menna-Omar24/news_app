import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/category_details_widget.dart';
import 'package:news_app/ui/home/widget/category/categories_tab.dart';
import 'package:news_app/ui/home/widget/custom_drawer.dart';
import 'package:news_app/ui/home/widget/settings_tab/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(onTapCategoryDetails: selectNewCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/pattern.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(
            onPress: selectedTab,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        body: selectedWidget,
      ),
    );
  }

  selectedTab(TabEnum tab) {
    switch (tab) {
      case TabEnum.categories:
        {
          selectedWidget = CategoriesTab(
            onTapCategoryDetails: selectNewCategory,
          );
        }
      // TODO: Handle this case.
      case TabEnum.settings:
        {
          selectedWidget = const SettingsTab();
        }
      // TODO: Handle this case.
    }
    setState(() {});
    Navigator.pop(context);
  }

  selectNewCategory(String id) {
    selectedWidget = CategoryDetailsWidget(categoryId: id);
    setState(() {});
  }
}
