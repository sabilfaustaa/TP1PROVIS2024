import 'Person.dart';
import 'Pesanan.dart';

class Pengguna extends Person {
  String _alamatPengiriman;
  List<Pesanan> _riwayatPembelian;

  Pengguna(String id, String nama, String email, this._alamatPengiriman,
      List<Pesanan> riwayatPembelian)
      : _riwayatPembelian = riwayatPembelian,
        super(id, nama, email);

  String get alamatPengiriman => _alamatPengiriman;
  set alamatPengiriman(String newAlamat) => _alamatPengiriman = newAlamat;

  List<Pesanan> get riwayatPembelian => _riwayatPembelian;

  void addPesanan(Pesanan pesanan) {
    _riwayatPembelian.add(pesanan);
  }

  void removePesanan(Pesanan pesanan) {
    _riwayatPembelian.remove(pesanan);
  }
}
