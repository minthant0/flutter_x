import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Obj/CardData.dart';

class ProductBox {
  ProductBox({Key key, this.name, this.description, this.price, this.image, this.carddata});
  final String name;
  final String description;
  final int price;
  final String image;
  final List<CardData> carddata;


}