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

## TUGAS 8

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()` : Menambahkan *route* baru di atas *route* yang sudah ada pada *stack*

Contoh:
```
Navigator.push(context, MaterialPageRoute<void>(
  builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Page')),
      body: Center(
        child: TextButton(
          child: const Text('POP'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  },
));
```

`Navigator.pushReplacement()` : Menggantikan *route* yang sudah ada pada atas *stack* dengan *route* baru tersebut.

Contoh:
```
...
    onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
```

### 2.  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Align: Widgets yang dapat menyesuaikan child nya di dalam dirinya dan secara opsional menyesuaikan ukurannya berdasarkan ukuran child. Contoh: untuk align di bagian kanan bawah, diatur dengan constraint yang lebih besar daripada ukurang child dengan Alignment.bottomRight
- ConstrainedbOx: Widget yang memberikan constraints tambahan kepada child nya. Contoh: Untuk mengatur child dengan minimum height 50.0 pixels, dapat menggunakan BoxConstraint(minHeight: 50.0)
- Container: Widget yang digunakan untuk pengaturan posisi, ukuran umum, serta pewarnaan.
- Padding: Widget ini akan mengecilkan *layout constraints* yang diberikan ke child ddan menyebabkan layout child berukuran lebih kecil. Kemudian widget ini akan menyesuaikan ukurannya dengan ukuran *child* sehingga ada *empty space* di sektiar child. Contoh: Pemberian padding pada child agar child memiliki batasan sehingga susunan menjadi lebih rapi.
- Row: Widget yang digunakan untuk mengatur secara hotizontal
- Column: Widget yang digunakan untuk mengatur secara vertikal
- Stack: Memungkinkan untuk *overlay* widgets di atas satu sama lain. Widgets diletakkan dengan widget `Positioned`
- Expanded: Digunakan dalam Row atau Column agar Child dapat mengambil *space* yang tersisa
- ListView: Menampilkan daftar elemen yang dapat digulir 
- GridView: Menampilkan daftar elemen yang dapat digulir dengan array dua dimensi.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Elemen input yang terdapat pada form, yaitu TextForm Field terdiri dari:
- TextForm field Nama Item untuk menambahkan nama item yang dimasukkan oleh pengguna. Terdapat validasi tidak boleh kosong.
- TextForm field Jumlah Item untuk menambahkan jumlah item yang dimasukkan oleh pengguna. Terdapat validasi input harus berupa angka.
- TextForm field Deskripsi untuk menambhakan deskripsi item yang dimasukkan oleh pengguna. Terdapat valiidasi input tidak boleh kosong.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture yang dimaksud adalah *blueprint* untu sistem modular dengan sistem *separation of concerns*. Lebih lajutnya, dengan cara memisahkan menjadi beberapa lapisan.
- Entities: Didefinisikan sebaga kelas POJO (Plain Old Dart Object) tanpa ketergantungan pada Flutter ataupun framework lainnya.
- Uses Cases (Interactors): Diimplementasikan sebagai class Dart biasa yang tidak memiliki ketergantungan pada framework.
- Repositories: Untuk berkomunikasi dengan sumber data eksternal, seperti API atau database
- Frameworks dan Drivers

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
1. Menambahkan drawer menu untuk navigasi dengan cara membuat file baru bernama `left_drawer.dart` dalam direktori baru bernama `widgets` dan menambahkan kode dibawah
```
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
                            builder: (context) => ShopFormPage(),
                            ));
                    },
                ),
                ListTile(
                  leading: const Icon(Icons.checklist),
                  title: const Text('Lihat Item'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ItemListPage(itemList: itemList),
                    ));
                  },
                )
                
                ],
            ),
        );
    }
}
```

2. Menambahkan Form dan alemen input dengan cara membuat direktori baru bernama `screens` lalu membuat file baru bernama `shoplist_form.dart` lalu menambahkan kode berikut
```
import 'package:flutter/material.dart';
import 'package:cocoa_boutique/widgets/left_drawer.dart';
import 'package:cocoa_boutique/models/models.dart';

List<Item> itemList = [];

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
              style: TextStyle(
              color: Color.fromARGB(255, 98, 21, 35), // Ubah warna teks
            ),
          ),
        ),
        backgroundColor:  Color.fromARGB(235, 248, 209, 154),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(235, 248, 209, 154),),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save the item to the itemList
                        Item newItem = Item(
                          name: _name,
                          amount: _amount,
                          description: _description,
                        );
                        itemList.add(newItem);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      _formKey.currentState!.reset();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
```

3. Menambahkan fitur navigasi pada tombol yang sudah dibuat sebelumnya agar ketika tombol ditekan akan mengarahkan ke halaman yang dimaksud
Pada direktori widgets, buat file baru bernama `shop_cart.dart` lalu pindahkan isi widget ShopItem dari `menu.dart` ke `shop_cart.dart`.
Tambahkan kode dibawah pada widget ShopItem agar navigasi dapat terjadi
```
...
  onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!")));
  // Navigate ke route yang sesuai (tergantung jenis tombol)
  if (item.name == "Lihat Item") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ItemListPage(itemList: itemList)));
  } else if (item.name == "Tambah Item") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
...
``` 

4. Membuat direkrori baru bernama `models` dan membuat file baru bernama `models.dart` sebagai tempat untuk menyimpan class baru, yaitu class item dan menambahkan code berikut
```
class Item {
  String name;
  int amount;
  String description;

  Item({
    required this.name,
    required this.amount,
    required this.description,
  });
}
```

5. Membuat file item_list.dart sebagai halaman yang akan menampilkan item yang telah ditambahkan lalu menambahkan code berikut
```
import 'package:flutter/material.dart';
import 'package:cocoa_boutique/models/models.dart';
import 'package:cocoa_boutique/widgets/left_drawer.dart';

class ItemListPage extends StatelessWidget {
  final List<Item> itemList;

  const ItemListPage({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Item',
          style: TextStyle(
            color: Color.fromARGB(255, 98, 21, 35), // Ubah warna teks
          ),
        ),
        backgroundColor: Color.fromARGB(235, 248, 209, 154),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(itemList[index].name),
              subtitle: Text('Jumlah: ${itemList[index].amount}'),
              onTap: () {
                // Menampilkan popup dengan informasi barang yang di-klik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(itemList[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Jumlah: ${itemList[index].amount}'),
                          Text('Deskripsi: ${itemList[index].description}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

6. Memindahkan berkas menu.dart ke direktori widgets agar file lebih tertata
