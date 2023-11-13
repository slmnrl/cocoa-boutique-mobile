import 'package:flutter/material.dart';
import 'package:cocoa_boutique/screens/shoplist_form.dart';
import 'package:cocoa_boutique/screens/item_list.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color bgColor;

  const ShopCard(this.item, this.bgColor, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Gunakan Navigator untuk melakukan navigasi MaterialPageRoute yang sesuai
          
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
            
          }
          if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemListPage(itemList: itemList)));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}