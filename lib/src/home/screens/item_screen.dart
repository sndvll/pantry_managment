import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:gold_door/src/home/home.dart';
import 'package:home_repository/home_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../icons.dart';

class ItemPage extends StatefulWidget {
  final Item item;

  ItemPage({@required this.item});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  SingleItemInfoController controller = SingleItemInfoController();

  AppBar _appbar(BuildContext context) => AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          AddToShoppingListButton(),
          DeleteItemButton(),
          EditItemButton(this.widget.item),
        ],
      );

  Widget get _header => Container(
        padding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomLeft,
        child: Text(
          widget.item.name,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      );

  Widget _firstRow(BuildContext context) => Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(icons[widget.item.type].iconData,
                  size: 18, color: icons[widget.item.type].color)),
          Text(itemTypeLabels(context)[widget.item.type],
              style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
              padding: EdgeInsets.only(left: 3, right: 3),
              child: Text('in')), //Todo add labels
          Text(itemPositionLabels(context)[widget.item.position],
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      );

  String get _expiring {
    // todo add labels
    if (widget.item.expiring == null) {
      return 'N/A';
    }
    if (widget.item.daysUntilExpiring == 0) {
      return 'Today';
    }
    if (widget.item.daysUntilExpiring == 1) {
      return 'Tomorrow';
    }
    return '${widget.item.daysUntilExpiring} days';
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(children: [
        _header,
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _firstRow(context),
        ),
        Row(
          children: <Widget>[
            SingleItemInfo(
              description: 'In the pantry',
              information:
                  '${widget.item.daysSinceAdded} days', // todo add label
            ),
            SingleItemInfo(
              controller: controller,
              description: 'Expiring',
              information: _expiring, // todo add labels (tooltip?)
              color: Colors.redAccent,
            ),
            SingleItemInfo(
              controller: controller,
              description: 'Amount',
              information:
                  '${widget.item.quantity.floor()} ${widget.item.unit}',
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SingleItemInfo(
              description: 'Is opened',
              information: widget.item.isOpen ? 'Yes' : 'No',
            ),
            SingleItemInfo(
              description: 'Brand',
              information:
                  widget.item.brand != null ? widget.item.brand : 'N/A',
            )
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(context),
      body: GestureDetector(
        onTap: () {
          if (this.controller.isVisible) {
            setState(() {
              this.controller.isVisible = false;
            });
          }
        },
        child: Portal(
          child: _body(context),
        ),
      ),
    );
  }
}
