import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/home.dart';

@immutable
class TabsInfo {
  final String name;
  final int count;
  final HomeTab tab;
  TabsInfo({@required this.name, this.count = 0, @required this.tab});
}

class CustomSliverAppBar extends StatelessWidget {
  final bool forceElevated;
  final TabController tabController;
  final List<TabsInfo> tabs;

  CustomSliverAppBar(
      {Key key, this.forceElevated = false, this.tabController, this.tabs})
      : super(key: key);

  void onSearch(BuildContext context, String value) {
    print(value);
    BlocProvider.of<ItemsFilterBloc>(context).add(OnSearch(value));
  }

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverSafeArea(
        top: false,
        bottom: false,
        sliver: SliverAppBar(
          automaticallyImplyLeading: false,
          primary: true,
          pinned: true,
          floating: true,
          expandedHeight: 100,
          forceElevated: forceElevated,
          elevation: 2,
          title: AppBarSearchField(
            onSearchCallback: (String value) => this.onSearch(context, value),
          ),
          bottom: TabBar(
            onTap: (index) {
              BlocProvider.of<HomeTabBloc>(context)
                  .add(HomeTabNavigationEvent(HomeTab.values[index]));
            },
            isScrollable: true,
            controller: tabController,
            tabs: tabs.map((tab) {
              return Tab(
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Tab(text: tab.name)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12.withAlpha(15),
                        borderRadius: BorderRadius.circular(50)),
                    height: 20,
                    constraints: BoxConstraints(minWidth: 20, minHeight: 20),
                    child: Center(
                      child: Text(
                        tab.count.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                    ),
                  )
                ]),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
