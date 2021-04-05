class Supplier {
  int _idSup;
  String _nameSup;
  String _alamat;
  String _noTelp;

  //setter dan getter untuk setiap baris
  int get idSup => _idSup;

  String get nameSup => this._nameSup;
  set nameSup(String value) => this._nameSup = value;

  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  String get noTelp => this._noTelp;
  set noTelp(String value) => this._noTelp = value;

  Supplier(this._nameSup, this._alamat, this._noTelp);

  //mengkonversi Map ke Item digunakan untuk menampung baris data dari tabel database
  Supplier.fromMap(Map<String, dynamic> map) {
    this._idSup = map['idSup'];
    this._nameSup = map['nameSup'];
    this._alamat = map['alamat'];
    this._noTelp = map['noTelp'];
  }

  //mengkonversi Item ke Map digunakan untuk memasukkan data ke dalam tabel
  Map<String, dynamic> toMapSup() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idSup'] = this._idSup;
    map['nameSup'] = nameSup;
    map['alamat'] = alamat;
    map['noTelp'] = noTelp;
    return map;
  }
}
