import 'dart:io';
import 'dart:math';

import 'IPembayaran.dart';
import 'Keranjang.dart';
import 'PembayaranKartu.dart';
import 'PembayaranTransfer.dart';
import 'Pengguna.dart';
import 'Pesanan.dart';
import 'ProductReview.dart';
import 'Produk.dart';
import 'ProdukElektronik.dart';
import 'ProdukPakaian.dart';

void printTableLine(int length) {
  print("+" + "-" * length + "+");
}

void printProductsTable(List<Produk> produkList) {
  // cari panjang maksimal untuk setiap kolom
  var maxLens = {
    "id": "ID".length,
    "nama": "Nama".length,
    "deskripsi": "Deskripsi".length,
    "harga": "Harga".length,
    "kategori": "Kategori".length,
    "stok": "Stok".length,
    "rating": "Rating".length,
  };

  for (var produk in produkList) {
    maxLens["id"] = max(maxLens["id"]!, produk.id.length);
    maxLens["nama"] = max(maxLens["nama"]!, produk.nama.length);
    maxLens["deskripsi"] = max(maxLens["deskripsi"]!, produk.deskripsi.length);
    maxLens["harga"] = max(maxLens["harga"]!, produk.harga.toString().length);
    maxLens["kategori"] = max(maxLens["kategori"]!, produk.kategori.length);
    maxLens["stok"] = max(maxLens["stok"]!, produk.stok.toString().length);
    maxLens["rating"] =
        max(maxLens["rating"]!, produk.rating.toStringAsFixed(1).length);
  }

  // hitung total panjang tabel
  int totalLength =
      maxLens.values.reduce((a, b) => a + b) + maxLens.length * 3 - 1;
  printTableLine(totalLength);

  // print header
  print(
      "| ${'ID'.padRight(maxLens['id']!)} | ${'Nama'.padRight(maxLens['nama']!)} | ${'Deskripsi'.padRight(maxLens['deskripsi']!)} | ${'Harga'.padRight(maxLens['harga']!)} | ${'Kategori'.padRight(maxLens['kategori']!)} | ${'Stok'.padRight(maxLens['stok']!)} | ${'Rating'.padRight(maxLens['rating']!)} |");
  printTableLine(totalLength);

  // print item produk
  for (var produk in produkList) {
    print(
        "| ${produk.id.padRight(maxLens['id']!)} | ${produk.nama.padRight(maxLens['nama']!)} | ${produk.deskripsi.padRight(maxLens['deskripsi']!)} | ${produk.harga.toString().padRight(maxLens['harga']!)} | ${produk.kategori.padRight(maxLens['kategori']!)} | ${produk.stok.toString().padRight(maxLens['stok']!)} | ${produk.rating.toStringAsFixed(1).padRight(maxLens['rating']!)} |");
  }

  printTableLine(totalLength);
}

void main() {
  // instansiasi user
  var pengguna = Pengguna("U1", "Muhamad Sabil Fausta",
      "msabilfaustaa@gmail.com", "Jl. Curug Candung no.35", []);

  // list produk dengan data dummy
  List<Produk> produkList = [
    ProdukElektronik("P01", "Laptop Gaming", "Laptop gaming high-end", 15000.0,
        "Elektronik", "urlGambar1", 5, 4.5, "2 tahun"),
    ProdukElektronik(
        "P02",
        "Smartphone Pro",
        "Smartphone dengan kamera terbaik",
        10000.0,
        "Elektronik",
        "urlGambar2",
        10,
        4.8,
        "1 tahun"),
    ProdukPakaian("P03", "Kaos Polos", "Kaos katun nyaman", 200.0, "Pakaian",
        "urlGambar3", 100, 4.6, "M", "Katun"),
    ProdukPakaian("P04", "Jaket Hoodie", "Hoodie hangat untuk musim dingin",
        500.0, "Pakaian", "urlGambar4", 50, 4.8, "L", "Wol"),
    ProdukElektronik(
        "P05",
        "Tablet",
        "Tablet serbaguna untuk pekerjaan dan hiburan",
        8000.0,
        "Elektronik",
        "urlGambar5",
        20,
        4.7,
        "1.5 tahun"),
    ProdukPakaian("P06", "Celana Jeans", "Celana jeans durable dan stylish",
        300.0, "Pakaian", "urlGambar6", 75, 4.5, "32", "Denim"),
  ];

  // instansiasi keranjang
  var keranjang = Keranjang();
  while (true) {
    // print menu
    printProductsTable(produkList);

    print("\nMenu Utama:");
    print("1. Tambahkan Produk ke Keranjang");
    print("2. Lihat Keranjang & Checkout");
    print("3. Lihat Riwayat Pembelian");
    print("4. Keluar");
    stdout.write("Pilih aksi: ");
    var aksi = stdin.readLineSync(); // read line untuk baca aksi yang dipilih

    switch (aksi) {
      case '1': // tambah produk ke keranjang
        stdout.write("Masukkan ID Produk: ");
        var idProduk = stdin.readLineSync();
        Produk? produkTerpilih;
        try {
          produkTerpilih =
              produkList.firstWhere((produk) => produk.id == idProduk);
        } catch (e) {
          produkTerpilih = null;
        }

        if (produkTerpilih != null) {
          stdout.write("Jumlah: ");
          var jumlahStr = stdin.readLineSync();
          if (jumlahStr != null && jumlahStr.isNotEmpty) {
            var jumlah = int.tryParse(jumlahStr);
            if (jumlah != null && jumlah > 0) {
              if (jumlah <= produkTerpilih.stok) {
                // kondisi ketika jumlah melebihi stok produk
                keranjang.tambahProduk(produkTerpilih, jumlah);
                print(
                    "${produkTerpilih.nama} (${produkTerpilih.id}) ditambahkan ke keranjang.");
              } else {
                print(
                    "Jumlah melebihi stok yang tersedia. Stok ${produkTerpilih.nama} hanya tersisa ${produkTerpilih.stok}");
              }
            } else {
              print("Jumlah tidak valid.");
            }
          }
        } else {
          print("Produk dengan ID '$idProduk' tidak ditemukan.");
        }
        break;
      case '2': // lihat keranjang & Checkout
        // print list keranjang saat ini
        print("Isi Keranjang:");
        keranjang.produk.forEach((prod, jumlah) {
          print("${prod.nama}: ${jumlah.toString()} unit");
        });
        print("Total Harga: ${keranjang.totalHarga.toStringAsFixed(2)}");

        // konfirmasi untuk melanjutkan pembayaran atau tidak
        stdout.write("Lanjutkan ke pembayaran? (y/n): ");
        var jawaban = stdin.readLineSync()?.toLowerCase();
        if (jawaban == 'y') {
          // pilih metode pembayaran
          stdout.write("Pilih Metode Pembayaran (1: Kartu, 2: Transfer): ");
          var metodePembayaran = stdin.readLineSync();
          IPembayaran pembayaran;

          // instansiasi objek pembayaran berdasarkan pilihan metode
          if (metodePembayaran == '1') {
            pembayaran = PembayaranKartu("PAY1", "1234567890",
                keranjang.totalHarga, DateTime.now(), "Diproses");
          } else {
            pembayaran = PembayaranTransfer("PAY2", "Bank XYZ",
                keranjang.totalHarga, DateTime.now(), "Diproses");
          }

          // proses pembayaran
          pembayaran.prosesPembayaran();

          // membuat pesanan dan menambahkannya ke riwayat pengguna
          var pesanan = Pesanan(
              "O${pengguna.riwayatPembelian.length + 1}",
              Map.from(keranjang.produk),
              keranjang.totalHarga,
              "Diproses",
              DateTime.now(),
              metodePembayaran == '1' ? "Kartu" : "Transfer",
              pengguna.alamatPengiriman);
          pengguna.addPesanan(pesanan);

          // kurangi stok produk
          keranjang.produk.forEach((prod, jumlah) {
            prod.stok -= jumlah;
          });

          // tampilkan nota/riwayat pembelian
          print("\nNota Pembelian:");
          print("ID Pesanan: ${pesanan.id}");
          pesanan.produk.forEach((prod, jumlah) {
            print("${prod.nama}: ${jumlah.toString().padLeft(3)} unit");
          });
          print("Total Harga: ${pesanan.totalHarga.toStringAsFixed(2)}");
          print("Metode Pembayaran: ${pesanan.metodePembayaran}");
          print("Tanggal Pembelian: ${pesanan.tanggalPembelian}");
          print("Status Pengiriman: ${pesanan.statusPengiriman}");

          // input Ulasan Produk
          List<ProductReview> ulasanProduk = [];

          print("\nSilakan berikan ulasan untuk produk yang telah dibeli:");
          pesanan.produk.forEach((prod, jumlah) {
            stdout.write("Masukkan rating untuk ${prod.nama} (1-5): ");
            var ratingStr = stdin.readLineSync();
            var rating = int.tryParse(ratingStr ?? '') ?? 0;

            stdout.write("Masukkan komentar untuk ${prod.nama}: ");
            var komentar = stdin.readLineSync() ?? "";

            // simpan ulasan ke list ulasanProduk
            var ulasan = ProductReview("R${prod.id}U${pengguna.id}", prod.id,
                pengguna.id, rating, komentar, DateTime.now());
            ulasanProduk.add(ulasan);

            print("Ulasan Anda untuk ${prod.nama} telah disimpan.");
          });

          // bersihkan keranjang setelah pembayaran berhasil
          keranjang.bersihkanKeranjang();
          print("\nPembayaran berhasil. Pesanan dibuat.");
        }
        break;
      case '3': // lihat Riwayat Pembelian
        print("Riwayat Pembelian:");
        if (pengguna.riwayatPembelian.isEmpty) {
          print("Belum ada pembelian.");
        } else {
          pengguna.riwayatPembelian.forEach((pesanan) {
            print("\nID Pesanan: ${pesanan.id}");
            print("Tanggal Pembelian: ${pesanan.tanggalPembelian}");
            print("Metode Pembayaran: ${pesanan.metodePembayaran}");
            print("Alamat Pengiriman: ${pesanan.alamatPengiriman}");
            print("Status Pengiriman: ${pesanan.statusPengiriman}");
            print("Detail Produk:");
            pesanan.produk.forEach((prod, jumlah) {
              print("  - ${prod.nama} (${prod.id}): ${jumlah.toString()} unit");
            });
            print("Total Harga: ${pesanan.totalHarga.toStringAsFixed(2)}");
          });
        }
        break;
      case '4': // keluar
        print("Keluar dari program.");
        return;
      default:
        print("Pilihan tidak valid.");
        break;
    }
  }
}
