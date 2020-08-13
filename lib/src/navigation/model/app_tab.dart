import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gold_door/src/add_item/add_item_screen.dart';
import 'package:gold_door/src/home/screens/home_screen.dart';
import 'package:gold_door/src/shopping_list/shopping_list_screen.dart';

enum AppTab { HOME, ADD, SHOPPING_LIST }

Map<AppTab, IconData> get appTabIcons => {
      AppTab.HOME: FontAwesomeIcons.home,
      AppTab.ADD: FontAwesomeIcons.plus,
      AppTab.SHOPPING_LIST: FontAwesomeIcons.shoppingCart,
    };

Map<AppTab, String> appTabLabels(context) => {
      // TODO Add labels from i10n file
      AppTab.HOME: 'Home',
      AppTab.ADD: 'Add',
      AppTab.SHOPPING_LIST: 'Shopping list',
    };

Map<AppTab, Widget> get appRoutes => {
      AppTab.HOME: HomeScreen(),
      AppTab.ADD: AddItemScreen(),
      AppTab.SHOPPING_LIST: ShoppingListScreen(),
    };
