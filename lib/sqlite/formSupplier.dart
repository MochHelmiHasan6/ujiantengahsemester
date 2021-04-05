import 'package:flutter/material.dart';
import '../supplier.dart';

class FormSupplier extends StatefulWidget {
  final Supplier supplier;
  FormSupplier(this.supplier);
  @override
  FormSupplierState createState() => FormSupplierState(this.supplier);
}

//class controller
class FormSupplierState extends State<FormSupplier> {
  Supplier supplier;
  FormSupplierState(this.supplier);
  TextEditingController nameSupController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi awal
    if (supplier != null) {
      nameSupController.text = supplier.nameSup;
      alamatController.text = supplier.alamat;
      notelpController.text = supplier.noTelp;
    }
    //merubah data
    return Scaffold(
      appBar: AppBar(
        title: supplier == null ? Text('Tambah') : Text('Ubah'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // nama
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameSupController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Supplier',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            //alamat
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: alamatController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // no telpon
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: notelpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // tombol button
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        if (supplier == null) {
                          // tambah data
                          supplier = Supplier(
                            nameSupController.text,
                            alamatController.text,
                            notelpController.text,
                          );
                        } else {
                          // ubah data
                          supplier.nameSup = nameSupController.text;
                          supplier.alamat = alamatController.text;
                          supplier.noTelp = notelpController.text;
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, supplier);
                      },
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
