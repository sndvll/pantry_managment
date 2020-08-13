import 'package:flutter/material.dart';
import 'package:gold_door/src/shared/shared.dart';

class ItemCard extends StatelessWidget {
  final double _bottomLineMargin = 5;
  final Widget leading;
  final Widget ending;
  final Widget header;
  final Widget body;
  final Widget bottom;
  final EdgeInsets margin;
  final VoidCallback onLongPress;
  final VoidCallback onDoubleTap;

  ItemCard(
      {@required this.leading,
      @required this.header,
      @required this.bottom,
      @required this.ending,
      @required this.body,
      this.onLongPress,
      this.onDoubleTap,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return CustomElevation(
        child: GestureDetector(
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Card(
          margin: margin,
          child: Padding(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    this.leading,
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                this.header,
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: _bottomLineMargin),
                                    child: this.bottom)
                              ],
                            ))),
                    this.ending
                  ]))),
    ));
  }
}
