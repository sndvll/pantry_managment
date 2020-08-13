import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_repository/home_repository.dart';

class EditItemModal extends StatefulWidget {
  final Item item;

  EditItemModal(this.item);

  @override
  _EditItemModalState createState() => _EditItemModalState();
}

class _EditItemModalState extends State<EditItemModal> {
  final _formKey = GlobalKey();

  Future<DateTime> _selectDate(
      BuildContext context, DateTime initialDate) async {
    return showDatePicker(
        context: context,
        locale: Locale('sv', 'SE'),
        initialDate: initialDate != null ? initialDate : DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 3650)));
  }

  save(Item newItem) {
    print(widget.item.toString());
    print(newItem.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            CheckboxListTile(
              title: Text('Is opened'),
              value: widget.item.isOpen,
              onChanged: (bool value) {
                save(widget.item.copyWith(isOpen: value));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonFormField<ItemPosition>(
                decoration: InputDecoration(labelText: 'Position'),
                value: widget.item.position,
                isExpanded: true,
                onChanged: (ItemPosition value) {
                  save(widget.item.copyWith(position: value));
                },
                items: ItemPosition.values.map(
                  (ItemPosition position) {
                    return DropdownMenuItem(
                      value: position,
                      child: Text(itemPositionLabels(context)[position]),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String value) {
                          save(widget.item
                              .copyWith(quantity: double.parse(value)));
                        },
                        initialValue: widget.item.quantity.floor().toString(),
                        decoration: InputDecoration(labelText: 'Amount')),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.item.unit,
                      decoration: InputDecoration(labelText: 'Unit'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                initialValue: widget.item.brand ?? '',
                decoration: InputDecoration(labelText: 'Brand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                onTap: () async {
                  DateTime picked =
                      await _selectDate(context, widget.item.expiring);
                  if (picked != null) {
                    save(widget.item.copyWith(expiring: picked));
                  }
                },
                readOnly: true,
                initialValue: widget.item.expiring != null
                    ? widget.item.expiring.toLocal().toString().split(' ')[0]
                    : null,
                decoration: InputDecoration(labelText: 'Expiring'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                onTap: () async {
                  DateTime picked =
                      await _selectDate(context, widget.item.added);
                  if (picked != null) {
                    save(widget.item.copyWith(added: picked));
                  }
                },
                readOnly: true,
                initialValue: widget.item.added != null
                    ? widget.item.added.toLocal().toString().split(' ')[0]
                    : null,
                decoration: InputDecoration(labelText: 'Brought home'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
