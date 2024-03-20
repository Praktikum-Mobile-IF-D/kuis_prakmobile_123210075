import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsi_123210075/screens/detail_screen.dart';
import 'package:responsi_123210075/utils/data_buku.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Home Screen",
          ),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 450,
              mainAxisSpacing: 20,
            ),
            itemCount: listBuku.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(buku: listBuku[index]);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        listBuku[index].imageLink,
                        height: 300,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        listBuku[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(height:8),
                      Text(
                        listBuku[index].author,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height:8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.book_outlined),
                          Text(listBuku[index].pages.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
