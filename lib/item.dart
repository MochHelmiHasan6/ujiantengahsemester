class Item {
  int _id;
  String _name;
  String _kategori;
  int _price;
  int _stok;

  //setter dan getter untuk setiap baris
  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kategori => this._kategori;
  set kategori(String value) => this._kategori = value;

  get price => this._price;
  set price(value) => this._price = value;

  get stok => this._stok;
  set stok(value) => this._stok = value;

  Item(this._name, this._kategori, this._price, this._stok);

  //mengkonversi Map ke Item digunakan untuk menampung baris data dari tabel database
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._kategori = map['kategori'];
    this._price = map['price'];
    this._stok = map['stok'];
  }

  //mengkonversi Item ke Map digunakan untuk memasukkan data ke dalam tabel
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['kategori'] = kategori;
    map['price'] = price;
    map['stok'] = stok;
    return map;
  }
}
