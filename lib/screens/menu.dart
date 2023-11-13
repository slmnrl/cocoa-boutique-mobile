import 'package:flutter/material.dart';
import 'package:cocoa_boutique/widgets/left_drawer.dart';
import 'package:cocoa_boutique/widgets/shop_cart.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cocoa Boutique',
          style: TextStyle(
            color: Color.fromARGB(255, 98, 21, 35), // Ubah warna teks
          ),
        ),
        backgroundColor: Color.fromARGB(235, 248, 209, 154),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome to Cocoa Boutique', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  Color bgColor = Colors.indigo;

                  if (item.name == "Lihat Item") {
                    bgColor = Color.fromARGB(255, 122, 89, 89); // Misalnya, warna latar belakang untuk "Lihat Item" adalah biru
                  } else if (item.name == "Tambah Item") {
                    bgColor = Color.fromARGB(255, 175, 124, 76);
                  } else if (item.name == "Logout") {
                    bgColor = Color.fromARGB(255, 201, 142, 124);
                  }
                  return ShopCard(item, bgColor);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
