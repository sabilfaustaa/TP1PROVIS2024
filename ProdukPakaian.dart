import 'Produk.dart';

class ProdukPakaian extends Produk {
  String _ukuran;
  String _bahan;

  ProdukPakaian(
      String id,
      String nama,
      String deskripsi,
      double harga,
      String kategori,
      String gambarUrl,
      int stok,
      double rating,
      this._ukuran,
      this._bahan)
      : super(id, nama, deskripsi, harga, kategori, gambarUrl, stok, rating);

  String get ukuran => _ukuran;
  set ukuran(String value) => _ukuran = value;

  String get bahan => _bahan;
  set bahan(String value) => _bahan = value;
}
