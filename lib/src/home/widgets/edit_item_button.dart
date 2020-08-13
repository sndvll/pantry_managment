import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gold_door/src/home/modals/edit_item_modal.dart';
import 'package:gold_door/src/shared/custom_bottom_sheet.dart';
import 'package:home_repository/home_repository.dart';

class EditItemButton extends StatelessWidget {
  final Item item;

  EditItemButton(this.item);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.solidEdit),
      onPressed: () {
        showModalCustomBottomSheet(
            context: context,
            dismissOnTap: false,
            builder: (BuildContext context) {
              return Container(child: EditItemModal(this.item));
            });
      },
    );
  }
}
