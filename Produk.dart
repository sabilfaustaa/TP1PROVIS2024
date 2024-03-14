class Produk {
  String _id;
  String _nama;
  String _deskripsi;
  double _harga;
  String _kategori;
  String _gambarUrl;
  int _stok;
  double _rating;

  Produk(this._id, this._nama, this._deskripsi, this._harga, this._kategori,
      this._gambarUrl, this._stok, this._rating);

  String get id => _id;
  String get nama => _nama;
  set nama(String value) => _nama = value;

  String get deskripsi => _deskripsi;
  set deskripsi(String value) => _deskripsi = value;

  double get harga => _harga;
  set harga(double value) => _harga = value;

  String get kategori => _kategori;
  set kategori(String value) => _kategori = value;

  String get gambarUrl => _gambarUrl;
  set gambarUrl(String value) => _gambarUrl = value;

  int get stok => _stok;
  set stok(int value) => _stok = value;

  double get rating => _rating;
  set rating(double value) => _rating = value;

  void updateStok(int terjual) {
    _stok -= terjual;
  }
}
