import 'package:flutter/material.dart';
import 'package:uts/sqlite/home.dart';
import 'package:uts/sqlite/sup.dart';
import 'package:uts/sqlite/spare.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/spare': (context) => Spare(),
      '/supplier': (context) => Sup(),
    },
  ));
}
