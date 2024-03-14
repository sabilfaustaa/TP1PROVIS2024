import 'Produk.dart';

class Keranjang {
  Map<Produk, int> _produk = {};
  double _totalHarga = 0.0;

  // get untuk produk dan total harga
  Map<Produk, int> get produk => _produk;
  double get totalHarga => _totalHarga;

  // hitung ulang total harga setelah perubahan
  void _hitungTotalHarga() {
    _totalHarga = _produk.entries
        .map((e) => e.key.harga * e.value)
        .fold(0.0, (a, b) => a + b);
  }

  // tambah produk ke  keranjang
  void tambahProduk(Produk produk, int jumlah) {
    if (_produk.containsKey(produk)) {
      _produk[produk] = _produk[produk]! + jumlah;
    } else {
      _produk[produk] = jumlah;
    }
    _hitungTotalHarga();
  }

  // hapus produk dari keranjang
  void hapusProduk(Produk produk) {
    _produk.remove(produk);
    _hitungTotalHarga();
  }

  // ubah jumlah produk
  void ubahJumlahProduk(Produk produk, int jumlah) {
    if (_produk.containsKey(produk)) {
      _produk[produk] = jumlah;
      _hitungTotalHarga();
    }
  }

  // clear keranjang
  void bersihkanKeranjang() {
    _produk.clear();
    _totalHarga = 0.0;
  }
}
