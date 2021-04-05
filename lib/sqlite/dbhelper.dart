import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../item.dart';
import '../supplier.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'sparepart.db';

    //membuat dan membaca database
    var database = openDatabase(path,
        version: 6, onCreate: _createDb, onUpgrade: _onUpgrade);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return database;
  }

  //update tabel baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS item');
    batch.execute('DROP TABLE IF EXISTS supplier');
    batch.execute('''
      CREATE TABLE item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      kategori TEXT,
      price INTEGER,
      stok INTEGER
      )
    ''');
    batch.execute('''
      CREATE TABLE supplier (
      idSup INTEGER PRIMARY KEY AUTOINCREMENT,
      nameSup TEXT,
      alamat TEXT,
      noTelp TEXT
      )
    ''');
    await batch.commit();
  }

  //select databases table item
  Future<List<Map<String, dynamic>>> selectItem() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'kategori');
    return mapList;
  }

  //select databases table supplier
  Future<List<Map<String, dynamic>>> selectSupplier() async {
    Database db = await this.initDb();
    var mapList = await db.query('supplier', orderBy: 'nameSup');
    return mapList;
  }

  //create databases table item
  Future<int> insertItem(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //create databases table supplier
  Future<int> insertSupplier(Supplier sup) async {
    Database db = await this.initDb();
    int count = await db.insert('supplier', sup.toMapSup());
    return count;
  }

  //update databases table item
  Future<int> updateItem(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //update databases table supplier
  Future<int> updateSupplier(Supplier sup) async {
    Database db = await this.initDb();
    int count = await db.update('supplier', sup.toMapSup(),
        where: 'idSup=?', whereArgs: [sup.idSup]);
    return count;
  }

  //delete databases table item
  Future<int> deleteItem(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //delete databases table supplier
  Future<int> deleteSupplier(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('supplier', where: 'idSup=?', whereArgs: [id]);
    return count;
  }

  //menambahkan data kedalam list
  Future<List<Item>> getItemList() async {
    var itemMapList = await selectItem();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  //menambahkan data kedalam list
  Future<List<Supplier>> getSupplierList() async {
    var supplierMapList = await selectSupplier();
    int count = supplierMapList.length;
    List<Supplier> supplierList = List<Supplier>();
    for (int i = 0; i < count; i++) {
      supplierList.add(Supplier.fromMap(supplierMapList[i]));
    }
    return supplierList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
