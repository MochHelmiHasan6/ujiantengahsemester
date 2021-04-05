import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/item.dart';
import 'dart:async';
import 'dbhelper.dart';
import 'formSupplier.dart';
import '../supplier.dart';

//pendukung program asinkron
class Sup extends StatefulWidget {
  @override
  SupState createState() => SupState();
}

class SupState extends State<Sup> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Supplier> supList;
  @override
  Widget build(BuildContext context) {
    if (supList == null) {
      supList = List<Supplier>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Spare Part'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Item"),
              onPressed: () async {
                var supplier = await navigateToEntryForm(context, null);
                if (supplier != null) {
                  int result = await dbHelper.insertSupplier(supplier);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  //Navigasi rute untuk menuju Form pengisian data
  Future<Supplier> navigateToEntryForm(
      BuildContext context, Supplier supplier) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormSupplier(supplier);
    }));
    return result;
  }

  //digunakan untuk membuat List Supplier
  ListView createListView() {
    updateListView();
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.supList[index].nameSup,
              style: textStyle,
            ),
            subtitle: Text(
              this.supList[index].noTelp,
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteSupplier(this.supList[index].idSup);
                updateListView();
              },
            ),
            onTap: () async {
              var supplier =
                  await navigateToEntryForm(context, this.supList[index]);
              int result = await dbHelper.updateSupplier(supplier);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

  //digunakan untuk update List supplier
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Supplier>> supListFuture = dbHelper.getSupplierList();
      supListFuture.then((supList) {
        setState(() {
          this.supList = supList;
          this.count = supList.length;
        });
      });
    });
  }
}
