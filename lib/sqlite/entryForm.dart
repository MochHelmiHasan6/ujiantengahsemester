import 'package:flutter/material.dart';
import '../item.dart';

class EntryForm extends StatefulWidget {
  final Item item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item item;
  EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi awal
    if (item != null) {
      nameController.text = item.name;
      kategoriController.text = item.kategori;
      priceController.text = item.price.toString();
      stokController.text = item.stok.toString();
    }
    //merubah data
    return Scaffold(
      appBar: AppBar(
        title: item == null ? Text('Tambah') : Text('Ubah'),
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
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Spare Part',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            //kategori
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: kategoriController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // harga
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            //stok
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stok',
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
                        if (item == null) {
                          // tambah data
                          item = Item(
                              nameController.text,
                              kategoriController.text,
                              int.parse(priceController.text),
                              int.parse(stokController.text));
                        } else {
                          // ubah data
                          item.name = nameController.text;
                          item.kategori = kategoriController.text;
                          item.price = int.parse(priceController.text);
                          item.stok = int.parse(stokController.text);
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
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
