import 'package:flutter/material.dart';
import 'package:gold_door/src/home/icons.dart';
import 'package:gold_door/src/home/screens/item_screen.dart';
import 'package:gold_door/src/home/widgets/item_card.dart';

import 'package:home_repository/home_repository.dart';
import 'package:icons_repository/icons_repository.dart';

class ItemList extends StatelessWidget {
  final PageStorageKey<String> key;
  final List<Item> items;
  final ItemPosition position;

  ItemList({this.key, @required this.items, this.position}) : super(key: key);

  void _onNavigateToItemPage(BuildContext context, Item item) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ItemPage(
              item: item,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: key,
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildListDelegate(items.map((Item item) {
              IconProps icon = icons[item.type];
              return ItemCard(
                  onDoubleTap: () => this._onNavigateToItemPage(context, item),
                  onLongPress: () => this._onNavigateToItemPage(context, item),
                  leading: Icon(icon.iconData, color: icon.color),
                  header: Text(item.name,
                      style: TextStyle(
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                  body: Text(''),
                  bottom: Text(
                      '${item.daysSinceAdded.toString()} days', // todo label
                      style: TextStyle(fontSize: 12)),
                  ending: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${item.quantity.floor().toString()} ${item.unit}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.5)),
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            position == null
                                // Position is set to null when
                                // rendering everything.
                                ? itemPositionLabels(context)[item.position]
                                : '',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .accentColor
                                    .withAlpha(150),
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5),
                          ))
                    ],
                  ));
            }).toList()),
          ),
        ),
      ],
    );
  }
}
