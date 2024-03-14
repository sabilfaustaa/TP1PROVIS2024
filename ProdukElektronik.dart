import 'Produk.dart';

class ProdukElektronik extends Produk {
  String _garansi;

  ProdukElektronik(String id, String nama, String deskripsi, double harga,
      String kategori, String gambarUrl, int stok, double rating, this._garansi)
      : super(id, nama, deskripsi, harga, kategori, gambarUrl, stok, rating);

  String get garansi => _garansi;
  set garansi(String value) => _garansi = value;
}
