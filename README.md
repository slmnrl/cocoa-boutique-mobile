Nama    : Salma Nurul Aziz
NPM     : 2206028661
Kelas   : PBP C

## TUGAS 7

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateles Widget: Jenis widget yang tidak memiliki state atau keadaan internal. Berfungsi sebagai tampilan statis yang deskripsinya hanya menerima data dari parent widget dan menampilkannya. Properti dalam stateless widget bersifat final dan didefinisikan selama construction dan tidak ada cara untuk memperbarui tampilan.

Stateful Widget: Jenis widget yang memiliki staate dan memungkinkan perubahan deskripsi atau tampilan widget dalam respons terhadap perubahan status internal ataupun peristiwa eksternal. Flutter akan membangun ulang widget untuk mencerminkan perubahan dari bagian widget yang statusnya berubah. Memberikan lebih banyak fleksibilitas dalam mengatasi interaksi dan perubahan data dalam aplikasi Flutter.
 
### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Beberapa komponen dasar yang membangun interface aplikasi:
1. Widget `Scaffold`: Widget yang menyediakan struktur dasar untuk aplikasi, termasuk AppBar dan body.
2. Widget `AppBar`: Widget yang menampilkan bilah aplikasi di bagian atas layar.
3. Widget `Text`: Widget yang digunakan teks di dalam AppBar.
4. Widget `SingleChildScrollView`: Widget yang digunakan untuk membuat area yang dapat discroll di dalam body.
5. Widget `Padding`: Widget yang digunakan untuk memberikan jarak antara elemen-elemen dalam widget.
6. Widget `Column`: Widget untuk menampilkan child widget secara vertikal.
7. Widget `GridView.count`: Widget yang mengatur tampilan dalam bentuk grid dengan jumlah kolom yang ditentukan
8. Widget `Material`: Widget yang digunakan untuk memberikan latar belakang warna.
9. Widget `InkWell`: Widget yang digunakan untuk membuat area yang responsif terhadap sentuhan.
10. Widget `Icon`: Widget yang digunakan untuk menampilkan icon.
11. Widget `Snackbar`: Widget yang digunakan untuk menampilkan pesar SnackBar.
12. Widget `Container`: Widget yang digunakan untuk mengelompokkan elemen-elemen dalam satu wadah.
13. Widget `MaterialApp`: Widget yang digunakan untuk mengkonfigurasi aplikasi, termasuk tema dan halaman utaman.

### 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Membuat membuat proyek Flutter dengan nama `cocoa_boutique` lalu masuk ke dalam direktori proyek dengan menjalankan
```
flutter create cocoa_boutique
cd cocoa_boutique
```
- Membuat file baru dalam direktori `cocoa_boutique/lib` dengan nama `menu.dart` yang merupakan file berisi widget-widget yang digunakan dalam halaman utaman aplikasi. File ini berfungsi untuk mengelola komponen-komponen yang digunakan dalam halaman utama.

Lalu menuliskan kode berikut:
```
import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color bgColor;

  const ShopCard(this.item, this.bgColor, {super.key}) ; // Constructor

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
                content: Text("Kamu telah menekan tombol ${item.name}")));
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

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_box_rounded),
        ShopItem("Logout", Icons.logout),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cocoa Boutique',
            style: TextStyle(
              color: Color.fromARGB(255, 56, 56, 56), // Ubah warna teks menjadi abu tua
            ),
          ),
          backgroundColor: Color.fromARGB(235, 248, 209, 154),
          
        ),
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
                    'Welcome to Cocoa Boutique',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
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
                      bgColor = Color.fromARGB(255, 175, 124, 76); // Warna latar belakang untuk "Tambah Item" adalah hijau
                    } else if (item.name == "Logout") {
                      bgColor = Color.fromARGB(255, 201, 142, 124); // Warna latar belakang untuk "Logout" adalah merah
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
```
- `main.dart` adalah file yang berfungsi untuk menginisialisasi dan mengonfigurasi aplikasi Flutter.

Lalu menambahkan code berikut dalam file `main.dart`:
```
import 'package:flutter/material.dart';
import 'package:cocoa_boutique/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocoa Boutique',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```