import 'package:flutter/material.dart';

import '../tabs.dart';

class TabBottomNavigationBar extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onSelected;

  TabBottomNavigationBar(
      {Key key, @required this.activeTab, @required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: AppTab.values.indexOf(activeTab),
      showUnselectedLabels: false,
      onTap: (index) => onSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(appTabIcons[tab]),
          ),
          title: Text(appTabLabels(context)[tab]),
        );
      }).toList(),
    );
  }
}
