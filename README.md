# shopping_list_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

   - Stateless widget adalah widget yang tidak memiliki keadaan internal (state) yang dapat berubah setelah dibuat. Setelah stateless widget dibuat kita tidak dapat mengubah nilai-nilai di dalamnya. Stateless widget cocok untuk tampilan yang tidak berubah sepanjang siklus hidup widget, seperti tampilan statis yang tidak memerlukan perubahan data. Stateless widget bersifat lebih efisien karena tidak perlu merender ulang ketika ada perubahan dalam keadaan.
   - Stateful widget adalah widget yang memiliki keadaan internal (state) yang dapat berubah selama siklus hidup widget. Kita masih dapat memperbarui mengubah keadaan widget tersebut. Stateful widget digunakan ketika kita perlu mengelola data yang berubah atau interaksi pengguna seperti formulir, animasi, dan tampilan dinamis lainnya. Stateful widget biasanya lebih kompleks daripada stateless widget karena mereka memiliki metode setState yang memungkinkan perubahan keadaan dan pembangunan ulang widget.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

   - Build widget, digunakan untuk merender tampilan (widget) yang akan ditampilkan dalam aplikasi

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

   - Membuat project Flutter baru dengan nama shopping_list_task
   - Merapihkan project dengan membuat file baru bernama `menu.dart` pada directory `shopping_list_task/lib`
   - Memindahkan class `MyHomePage` dari `main.dart` ke `menu.dart`
   - Tambahkan kode

   ```
   import 'package:flutter/material.dart';
   ```

   pada awal file `menu.dart`

   - Tambahkan kode

   ```
   import 'package:shopping_list_task/menu.dart';
   ```

   pada awal file `main.dart`

   - Mengubah material color pada file `main.dart`

   ```
   colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
   ```

   - Mengganti kode `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()` pada file `main.dart`
   - Membuat sifat widget halaman menjadi stateless dengan mengganti `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`
   - Menghapus kode `Final String title` sampai akhir class dengan kode

   ```
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           ...
       );
   }
   ```

   - Menambahkan teks dan card

   ```
   class ShopItem {
   final String name;
   final IconData icon;

   ShopItem(this.name, this.icon);
   }
   ```

   define tipe untuk item

   - Menambahkan kode berikut dibawah kode `({Key? key}) : super(key: key);` untuk menambahkan barang-barang yang dijual

   ```
   final List<ShopItem> items = [
   ShopItem("Lihat Item", Icons.checklist),
   ShopItem("Tambah Item", Icons.add_shopping_cart),
   ShopItem("Logout", Icons.logout),
   ];
   ```

   - Menambahkan kode berikut didalam widget build

   ```
   return Scaffold(
     appBar: AppBar(
       title: const Text(
         'Shopping List',
       ),
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
                 'PBP Shop', // Text yang menandakan toko
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 30,
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
                 return ShopCard(item);
               }).toList(),
             ),
           ],
         ),
       ),
     ),
   );
   ```

   - Membuat widget stateless baru untuk menampilkan card

   ```
   class ShopCard extends StatelessWidget {
   final ShopItem item;

   const ShopCard(this.item, {super.key}); // Constructor

   @override
   Widget build(BuildContext context) {
       return Material(
       color: Colors.indigo,
       child: InkWell(
           // Area responsive terhadap sentuhan
           onTap: () {
           // Memunculkan SnackBar ketika diklik
           ScaffoldMessenger.of(context)
               ..hideCurrentSnackBar()
               ..showSnackBar(SnackBar(
                   content: Text("Kamu telah menekan tombol ${item.name}!")));
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
   ```

## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
  - `Navigator.push()` digunakan untuk menavigasi ke halaman baru dan menambahkannya ke tumpukan navigasi. Jadi jika Anda menavigasi dari Halaman1 ke Halaman2 menggunakan `Navigator.push()`, maka Halaman2 akan ditambahkan ke atas Halaman1 dalam tumpukan navigasi. Ketika Anda menekan tombol kembali, Anda akan kembali ke Halaman1.
  - contoh penggunaan `Navigator.push()`
  ```
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Halaman2()),
    );
  ```
  - `Navigator.pushReplacement()` digunakan untuk menavigasi ke halaman baru dan menggantikan halaman saat ini dalam tumpukan navigasi. Oleh karena itu, jika Anda menavigasi dari Halaman1 ke Halaman2 menggunakan `Navigator.pushReplacement()`, maka Halaman2 akan menggantikan Halaman1 dalam tumpukan navigasi. Ketika Anda menekan tombol kembali, Anda tidak akan kembali ke Halaman1, karena Halaman1 telah digantikan oleh Halaman2.
  - contoh penggunaan `navigator.pushReplacement()`
  ```
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Halaman2()),
    );
  ```
2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
  - Container
    Container adalah widget dasar yang digunakan untuk mengatur tata letak dan dekorasi. Ini dapat mengandung satu widget anak dan dapat dikustomisasi dengan properti seperti padding, margin, warna, dan sebagainya. Container sering digunakan sebagai wadah umum untuk widget lain dan memungkinkan penyesuaian tata letak dan dekorasi dasar.
    ```
    Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      color: Colors.blue,
      child: Text('Hello, Flutter!'),
    )
    ```
  - Column:
  Column adalah widget yang mengatur anak-anaknya dalam satu kolom vertikal. Ini berguna ketika Anda ingin menumpuk widget secara vertikal. Digunakan untuk mengorganisir widget secara vertikal, seperti daftar vertikal atau tumpukan elemen tata letak.
  ```
  Column(
    children: <Widget>[
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
    ],
  )
  ```
  - Row
  Row adalah widget yang mengatur anak-anaknya dalam satu baris horizontal. Ini berguna ketika Anda ingin menempatkan widget secara berdampingan. Digunakan untuk mengorganisir widget secara horizontal, seperti baris ikon atau tata letak baris yang terdiri dari beberapa elemen.
  ```
  Row(
    children: <Widget>[
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
    ],
  )
  ```
  - ListView
  ListView adalah widget yang menyusun widget anak-anaknya dalam daftar bergulir. Ini sangat berguna ketika Anda memiliki banyak item dan ingin memungkinkan pengguna untuk menggulir melihatnya. Cocok untuk daftar panjang atau item yang dapat digulir.
  ```
  ListView(
    children: <Widget>[
      ListTile(
        title: Text('Item 1'),
      ),
      ListTile(
        title: Text('Item 2'),
      ),
      // ...
    ],
  )
  ```
  - GridView
  GridView adalah widget yang menyusun widget anak-anaknya dalam bentuk kotak atau grid. Ini berguna ketika Anda ingin menampilkan data dalam format grid. Digunakan untuk menampilkan item dalam bentuk grid, seperti galeri gambar atau tata letak papan permainan.
  ```
  GridView.count(
    crossAxisCount: 2,
    children: <Widget>[
      Card(child: Image.network('url_to_image')),
      Card(child: Image.network('url_to_image')),
      // ...
    ],
  )
  ```
  - Stack 
  Stack adalah widget yang menempatkan anak-anaknya di atas satu sama lain. Ini memungkinkan tumpukan tumpukan elemen di layar. Digunakan ketika Anda ingin menumpuk beberapa widget dan menunjukkan semuanya atau hanya sebagian dari mereka.
  ```
  Stack(
    children: <Widget>[
      Positioned(
        left: 10.0,
        top: 10.0,
        child: Text('Top Left'),
      ),
      Positioned(
        right: 10.0,
        bottom: 10.0,
        child: Text('Bottom Right'),
      ),
      // ...
    ],
  )
  ```

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
  - Elemen input yang digunakan pada form pada tugas ini hanya TextFormField dengan validasi input tertentu. Elemen input tersebut digunakan karena isi formnya mengharuskan pengguna untuk mengetik sendiri semua data-data yang dibutuhkan, dan TextFormField merupakan elemen yang paling cocok untuk tujuan tersebut.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
  - Dalam Flutter, implementasi Clean Architecture dapat melibatkan pembagian kode ke dalam tiga lapisan utama: Presenter (atau ViewModel di Flutter), Use Case, dan Repository. Ini memisahkan logika bisnis dari kerangka UI dan infrastruktur.

  1. Presenter:
    - Bertanggung jawab untuk logika tampilan dan interaksi pengguna.
    - Menggunakan model untuk menampung dan memanipulasi data yang akan ditampilkan.
  2. Use Case:
    - Mengekstrak dan memproses data dari repository.
    - Mengandung aturan bisnis dan logika aplikasi.
  3. Repository:
    - Berkomunikasi dengan sumber daya eksternal seperti API atau database.
    - Menyediakan data yang dibutuhkan oleh use case.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
  - Membuat file baru bernama `addbook_form.dart` lalu menambahkan kode
  ```
  import 'package:flutter/material.dart';

  class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
  }

  class _ShopFormPageState extends State<ShopFormPage> {

      @override
      Widget build(BuildContext context) {
          return Placeholder();
      }
  }
  ```

  - Ubah widget Placeholder dengan kode berikut ini:
  ```
  Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text(
          'Form Tambah Produk',
        ),
      ),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    // TODO: Tambahkan drawer yang sudah dibuat di sini
    body: Form(
      child: SingleChildScrollView()
    ),
  );
  ```

  - Buat variabel baru bernama _formKey lalu tambahkanke dalam atribut key pada widget Form. Atribut key akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form.
  ```
  ...
  class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  ...
  ```
  ```
  ...
  body: Form(
      key: _formKey,
      child: SingleChildScrollView(),
    ),
  ...
  ```

  - Buat variable untuk input masing-masing field
  ```
  ...
  class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _bookName = "";
  String _author = "";
  String _datePublished = "";
  int _totalPages = 0;
  int _timesReaded = 0;
  String _description = "";
  ...
  ```

  - Buat column sebagai child dari SingleChildScrollView
  ```
  ...
  body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column()
        )
  ...
  ```
  
  - Buat widget TextFormField yang dibungkus oleh Padding sebagai salah satu children dari  Column. Setelah itu, tambahkan  crossAxisAlignment untuk mengatur alignment children dari Column
  ```
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Book Name",
            labelText: "Book Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _bookName = value!;
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Book Name cannot be empty!";
            }
            return null;
          },
        ),
      ),
  ```

  - Memastikan input berupa integer untuk field integer
  ```
  ...
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    // Hanya menerima input digit
  ],
  // TODO: Tambahkan variabel yang sesuai
  onChanged: (String? value) {
    setState(() {
      _amount = int.parse(value!);
    });
  },
  ...
  ```

  - Buatlah tombol sebagai child selanjutnya dari Column. Bungkus tombol ke dalam widget Padding dan Align. Kita akan memunculkan pop-up yang akan muncul setelah tombol ditekan
  ```
  ...
  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.indigo),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
  ...
  ```

  - Lalu membuat kode untuk mengarahkan pengguna ke halam form tambah item baru ketika tombol add item ditekan pada homepage
  - Pada `menu.dart` import page form yang sudah dibuat
  ```
  import 'package:shopping_list_task/screens/addbook_form.dart';
  ```

  - Di bawah bagian ScaffoldMessenger, tambahkan kode berikut untuk menambahkan navigasi ke halaman formulir yang sudah dibuat. 
  ```
  onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ShopFormPage(),
            ));
          }
        },
  ```

  - Setelah itu memunculkan data dalam pop up dengan menambahkan fungsi showDialog() pada bagian onPressed() dan memunculkan AlertDialog pada fungsi tersebut. Lalu tambahkan juga fungsi untuk reset form
  ```
  child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Produk berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Book Name: $_bookName'),
                                  Text('Book Author: $_author'),
                                  Text('datePublished: $_datePublished'),
                                  Text('Total Pages: $_totalPages'),
                                  Text('Times Readed: $_timesReaded'),
                                  Text('Book Description: $_description'),
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
  ```

  - Lalu membuat drawer dengan membuat file baru pada folder widgets dengan nama `left_drawer.dart` dan isi dengan kode berikut
  ```
  import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              // TODO: Bagian drawer header
            ),
            // TODO: Bagian routing
          ],
        ),
      );
    }
  }
  ```

  - tambah impor untuk halaman pada drawer
  ```
  import 'package:shopping_list_task/screens/booklist_page.dart';
  import 'package:shopping_list_task/screens/menu.dart';
  import 'package:shopping_list_task/screens/addbook_form.dart';
  ```

  - Masukkan routing untuk halaman pada drawer
  ```
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
              title: const Text('Tambah Produk'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopFormPage(),
                    ));
              }),
          ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Lihat Buku'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookListPage(itemList: itemList),
                    ));
              }),
  ```
  
  - masukkan drawer ke `menu.dart` dan `addbook_form.dart`
  menu.dart
  ```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),
  ```
  addbook_form.dart
  ```
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
  ```