import 'IPembayaran.dart';

class PembayaranTransfer implements IPembayaran {
  String _id;
  String _bank;
  double _jumlah;
  DateTime _tanggalPembayaran;
  String _status;

  PembayaranTransfer(this._id, this._bank, this._jumlah,
      this._tanggalPembayaran, this._status);

  @override
  void prosesPembayaran() {
    print("Memproses transfer sejumlah $_jumlah ke bank $_bank");
    _status = "Berhasil";
    print("Transfer berhasil!");
  }

  String get id => _id;
  set id(String value) => _id = value;

  String get bank => _bank;
  set bank(String value) => _bank = value;

  double get jumlah => _jumlah;
  set jumlah(double value) => _jumlah = value;

  DateTime get tanggalPembayaran => _tanggalPembayaran;
  set tanggalPembayaran(DateTime value) => _tanggalPembayaran = value;

  String get status => _status;
  set status(String value) => _status = value;
}
