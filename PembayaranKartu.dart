import 'IPembayaran.dart';

class PembayaranKartu implements IPembayaran {
  String _id;
  String _nomorKartu;
  double _jumlah;
  DateTime _tanggalPembayaran;
  String _status;

  PembayaranKartu(this._id, this._nomorKartu, this._jumlah,
      this._tanggalPembayaran, this._status);

  @override
  Future<void> prosesPembayaran() async {
    // ceritanya ada proses pembayaran pake kartu sekalian contoh
    // untuk implementasi polymorpism dimana method yang sama namun memiliki perbedaan
    print("Memproses pembayaran menggunakan kartu...");
    print("\nsejumlah $_jumlah menggunakan kartu nomor $_nomorKartu");
    _status = "Berhasil";
    await Future.delayed(Duration(seconds: 2));
    print("Pembayaran dengan kartu berhasil.");
  }

  String get id => _id;
  set id(String value) => _id = value;

  String get nomorKartu => _nomorKartu;
  set nomorKartu(String value) => _nomorKartu = value;

  double get jumlah => _jumlah;
  set jumlah(double value) => _jumlah = value;

  DateTime get tanggalPembayaran => _tanggalPembayaran;
  set tanggalPembayaran(DateTime value) => _tanggalPembayaran = value;

  String get status => _status;
  set status(String value) => _status = value;
}
