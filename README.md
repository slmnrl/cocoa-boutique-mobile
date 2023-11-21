# Cocoa Boutique🍫🫕

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

## TUGAS 9

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya. Pengambilan data JSON bisa dilakukan dengan menggunakan variabel yang menyimpan _dictionary_ berisi data. Namun, hal ini tidak lebih baik daripada membuat model. Membuat model dapat mempermudah pengambilan data karena suatu objek dapat dipastikan memiliki semua nilai atribut pada kelas.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah salah satu _class_ pasa _package_ `pbp_django_auth.dart`. Beberapa fungsi _class_ CookieRequest:
- Menyediakan fungsi untuk inisialisasi sesi, login, dan logout sehingga aplikasi dapat mlacak status login dan sesi pengguna
- Cookies berupa infomrasi sesi tersebut disimpan secara lokal
- Melakukan permintaan HTTP metode GET dan POST

CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter dengan tujuan agar status login atau sesi konsisten. Jadi, jika status login atau sesi diubah dalam suatu komponen, maka status login atau sesi di komponen lain akan berubah juga.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
- Membuat model kustom untuk membuat data JSON
- Menambahkan dependensi HTTP pada proyek Flutter untuk memperbolehkan akses internet
- Melakukan fetch data 
- Menampilkan data dengan widget `FutureBuilder`.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Mengambil input pengguna dari form login widget Flutter
- Mengirim data login dengan HTTP request ke endpoint Django yang bertanggung jawab untuk autentikasi
- Fungsi view di Django mengautentikasi dengan `authenticate` untuk memeriksa kredensial dan `login` untuk mengautentikasi pengguna.
- Flutter menerima respons dari server Django
- Setelah pengguna berhasil login, gunakan Navigator untuk beralih ke halaman menu yang ingin ditampilkan

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- Widget `TextField`: Widget yang memungkinkan pengguna memasukkan teks ketika melakukan suatu inpt, misalnya nama pengguna dan kata sandi.
- Widget `FutureBuilder`: Widget untuk membangun widget secara asinkron. Widget ini digunakan untuk mengelola status loading, error, dan data yang tersedia.
- Widget `ListView.builder`: Widget yang untuk membuat daftar yang dapat discroll.
- Widget `Column`: Widget untuk menyusun komponen secara vertikal
- widget `SizedBox`: Widget untuk menambahkan ruang vertikal

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Melakukan integrasi autentikasi Django-Flutter.

Membuat app pada project Django dengan nama `authentication` dan meng-_install_ library `corsheaders`. Lalu, membuat fungsi login dan logout dalam file `views.py` pada app `authentication`.

Dalam project Flutter, _install package_ `pbp_django_auth` dan modifikasi _root_ widget untuk menyediakan _instance_ `CookieRequest` dengan semua komponen pada proyek dalam file `main.dart`

Membuat `login.dart` dalam direktori `lib/screens` untuk menampilkan halaman login.

2. Membuat Model Kustom
Dengan bantuan situs web Quicktype, buat model JSON dan tambahkan kode nya ke dalam file `models.dart`
```
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int amount;
    String description;
    int user;

    Fields({
        required this.name,
        required this.amount,
        required this.description,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "description": description,
        "user": user,
    };
}
```

3. Menampilkan Halaman Lihat Item
Pada file `lib/screens/item_list.dart` ganti kode dengan kode berikut untuk menampilkan data 
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cocoa_boutique/models/models.dart';
import 'package:cocoa_boutique/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Item>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'https://salma-nurul21-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Item.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```

Lalu, tambahkan kode berikut pada `shop_cart.dart` agar widget dapat melakukan routing ketika diklik
```
else if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  const ProductPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://salma-nurul21-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
```


