import 'package:flutter/material.dart';
import 'package:home_repository/home_repository.dart';
import 'package:icons_repository/icons_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Map<ItemType, IconProps> icons = {
  ItemType.VEGETABLE: IconProps(FoodAndDrinkIcons.big_carrot, Colors.orange),
  ItemType.DAIRY: IconProps(FoodAndDrinkIcons.milk_container, Colors.brown),
  ItemType.CHEESE: IconProps(FoodAndDrinkIcons.cheese, Colors.yellow),
  ItemType.EGGS: IconProps(FontAwesomeIcons.egg, Colors.black12),
  ItemType.MEAT: IconProps(FoodAndDrinkIcons.big_steak, Colors.brown),
  ItemType.CANNED: IconProps(FoodAndDrinkIcons.fish_conserve, Colors.grey),
  ItemType.PASTA:
      IconProps(FoodAndDrinkIcons.ramen_bowl, Colors.yellow.withAlpha(130)),
  ItemType.BREAD: IconProps(
      FoodAndDrinkIcons.bread_piece_with_seeds, Colors.brown.withAlpha(120)),
  ItemType.FRUIT: IconProps(FoodAndDrinkIcons.mellon_slice, Colors.red),
  ItemType.FISH: IconProps(FontAwesomeIcons.fish, Colors.lightBlueAccent),
  ItemType.HERBS_AND_SPICES:
      IconProps(FoodAndDrinkIcons.restaurant_salt_and_pepper, Colors.black54),
  ItemType.OTHER: IconProps(FontAwesomeIcons.questionCircle, Colors.black),
};
