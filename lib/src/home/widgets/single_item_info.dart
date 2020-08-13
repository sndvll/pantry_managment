import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class SingleItemInfoController {
  bool isVisible = false;
}

class SingleItemInfo extends StatefulWidget {
  final String description;
  final String information;
  final Color color;
  final SingleItemInfoController controller;

  const SingleItemInfo(
      {Key key,
      @required this.description,
      @required this.information,
      this.controller,
      this.color = Colors.black})
      : super(key: key);

  @override
  _SingleItemInfoState createState() => _SingleItemInfoState();
}

class _SingleItemInfoState extends State<SingleItemInfo> {
  bool get _visible {
    if (this.widget.controller != null) {
      return widget.controller.isVisible;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PortalEntry(
      visible: _visible,
      childAnchor: Alignment.topCenter,
      portalAnchor: Alignment.bottomCenter,
      portal: Material(
        elevation: 10,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
          child: Text('hi'),
        ),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          /*
          setState(() {
            if (this.widget.controller != null) {
              this.widget.controller.isVisible =
                  !this.widget.controller.isVisible;
            }
          });
          */
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(minWidth: 118),
              //color: Colors.yellow,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(left: 10, bottom: 4),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 1.2,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.information,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
