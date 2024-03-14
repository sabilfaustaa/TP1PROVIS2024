class ProductReview {
  String _id;
  String _produkId;
  String _penggunaId;
  int _rating;
  String _komentar;
  DateTime _tanggal;

  ProductReview(this._id, this._produkId, this._penggunaId, this._rating,
      this._komentar, this._tanggal);

  String get id => _id;
  String get produkId => _produkId;
  String get penggunaId => _penggunaId;

  int get rating => _rating;
  set rating(int value) => _rating = value;

  String get komentar => _komentar;
  set komentar(String value) => _komentar = value;

  DateTime get tanggal => _tanggal;
}
