import 'Produk.dart';

class Pesanan {
  String _id;
  Map<Produk, int> _produk;
  double _totalHarga;
  String _statusPengiriman;
  DateTime _tanggalPembelian;
  String _metodePembayaran;
  String _alamatPengiriman;

  Pesanan(this._id, this._produk, this._totalHarga, this._statusPengiriman,
      this._tanggalPembelian, this._metodePembayaran, this._alamatPengiriman);

  String get id => _id;
  Map<Produk, int> get produk => _produk;
  double get totalHarga => _totalHarga;

  String get statusPengiriman => _statusPengiriman;
  set statusPengiriman(String value) => _statusPengiriman = value;

  DateTime get tanggalPembelian => _tanggalPembelian;

  String get metodePembayaran => _metodePembayaran;
  set metodePembayaran(String value) => _metodePembayaran = value;

  String get alamatPengiriman => _alamatPengiriman;
  set alamatPengiriman(String value) => _alamatPengiriman = value;
}
