import 'package:flutter/material.dart';
import 'package:cocoa_boutique/screens/menu.dart';
import 'package:cocoa_boutique/screens/shoplist_form.dart';
import 'package:cocoa_boutique/screens/item_list.dart';

class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(235, 248, 209, 154),
                        ),
                        child: Column(
                            children: [
                            Text(
                                'Cocoa Boutique',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 98, 21, 35), 
                                ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Handcrafted Chocolate",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 98, 21, 35), 
                                    ),
                                ),
                            ],
                        ),
                    ),
                // Bagian routing
                ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Halaman Utama'),
                    // Bagian redirection ke MyHomePage
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                            ));
                    },
                ),

                ListTile(
                    leading: const Icon(Icons.add_shopping_cart),
                    title: const Text('Tambah Item'),
                    // Bagian redirection ke ShopFormPage
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const ShopFormPage(),
                            ));
                    },
                ),
                ListTile(
                    leading: const Icon(Icons.shopping_basket),
                    title: const Text('Daftar Item'),
                    onTap: () {
                        // Route menu ke halaman produk
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductPage()),
                        );
                    },
                ),
                
                ],
            ),
        );
    }
}