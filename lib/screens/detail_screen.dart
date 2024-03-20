import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsi_123210075/utils/data_buku.dart';

class DetailScreen extends StatefulWidget {
  final DataBuku buku;
  const DetailScreen({super.key, required this.buku});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(widget.buku.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.buku.imageLink),
            SizedBox(height: 20),
            Text('Penulis                   : ${widget.buku.author}'),
            Text('Bahasa                    : ${widget.buku.language}'),
            Text('Negara                    : ${widget.buku.country}'),
            Text('Jumlah Halaman  : ${widget.buku.pages.toString()}'),
            Text('Tahun Terbit          : ${widget.buku.year.toString()}'),
            Text(
                'Status                    : ${widget.buku.isAvailable ?'Tersedia':'Tidak Tersedia'}'),
                SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  print('masuk');
                  SnackBar snackBar = SnackBar(
                    content: Text(widget.buku.isAvailable? 'Buku berhasil dipinjam' : 'Buku gagal dipinjam karena tidak tersedia'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('Pinjam'))
          ],
        ),
      ),
    );
  }
}
