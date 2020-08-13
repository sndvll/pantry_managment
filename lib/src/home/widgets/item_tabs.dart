import 'package:flutter/material.dart';
import 'package:gold_door/src/home/home.dart';
import 'package:home_repository/home_repository.dart';

class ItemTabs extends StatefulWidget {
  final TabController tabController;
  final List<Item> items;

  ItemTabs({@required this.tabController, @required this.items});

  @override
  ItemTabsState createState() => ItemTabsState();
}

class ItemTabsState extends State<ItemTabs> {
  List<Item> fridgeItems;
  List<Item> freezerItems;
  List<Item> pantryItems;
  List<Item> otherItems;

  List<Item> filterItems(ItemPosition position) =>
      widget.items.where((item) => item.position == position).toList();

  Map<HomeTab, TabsInfo> tabs(BuildContext context) => {
        HomeTab.FRIDGE: TabsInfo(
            name: homeTabLabels(context)[HomeTab.FRIDGE],
            tab: HomeTab.FRIDGE,
            count: fridgeItems.length),
        HomeTab.FREEZER: TabsInfo(
            name: homeTabLabels(context)[HomeTab.FREEZER],
            tab: HomeTab.FREEZER,
            count: freezerItems.length),
        HomeTab.PANTRY: TabsInfo(
            name: homeTabLabels(context)[HomeTab.PANTRY],
            tab: HomeTab.PANTRY,
            count: pantryItems.length),
        HomeTab.OTHER: TabsInfo(
            name: homeTabLabels(context)[HomeTab.OTHER],
            tab: HomeTab.PANTRY,
            count: otherItems.length),
        HomeTab.ALL: TabsInfo(
            name: homeTabLabels(context)[HomeTab.ALL],
            tab: HomeTab.ALL,
            count: widget.items.length),
      };

  Map<HomeTab, ItemList> pages(Key key) => {
        HomeTab.FREEZER: ItemList(
          key: key,
          position: ItemPosition.FREEZER,
          items: freezerItems,
        ),
        HomeTab.FRIDGE: ItemList(
          key: key,
          position: ItemPosition.FRIDGE,
          items: fridgeItems,
        ),
        HomeTab.PANTRY: ItemList(
          key: key,
          position: ItemPosition.PANTRY,
          items: pantryItems,
        ),
        HomeTab.OTHER: ItemList(
          key: key,
          position: ItemPosition.OTHER,
          items: otherItems,
        ),
        HomeTab.ALL: ItemList(key: key, items: widget.items),
      };

  @override
  Widget build(BuildContext context) {
    setState(() {
      fridgeItems = filterItems(ItemPosition.FRIDGE);
      freezerItems = filterItems(ItemPosition.FREEZER);
      pantryItems = filterItems(ItemPosition.PANTRY);
      otherItems = filterItems(ItemPosition.OTHER);
    });
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          CustomSliverAppBar(
            tabController: widget.tabController,
            tabs: HomeTab.values
                .map((HomeTab tab) => tabs(context)[tab])
                .toList(),
          )
        ];
      },
      body: SafeArea(
          top: false,
          bottom: true,
          child: TabBarView(
              controller: widget.tabController,
              children: HomeTab.values.map((HomeTab tab) {
                return Builder(
                  builder: (BuildContext context) =>
                      pages(PageStorageKey<String>(tab.toString()))[tab],
                );
              }).toList())),
    );
  }
}
