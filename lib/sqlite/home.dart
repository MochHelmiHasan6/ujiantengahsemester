import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Masukkan Data Spare Part'),
              //button menuju halaman Spare Part
              Padding(
                padding: EdgeInsets.all(30.0),
                child: OutlineButton(
                  child: Text('SPARE PART'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/spare');
                  },
                ),
              ),
              Text('Masukkan Data Supplier'),
              //button menuju halaman Supplier
              Padding(
                padding: EdgeInsets.all(30.0),
                child: OutlineButton(
                  child: Text('SUPPLIER'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/supplier');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
