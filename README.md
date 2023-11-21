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



## Tugas 9
1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
  - Ya, pada Flutter kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Caranya adalah dengan menggunakan library atau framework yang mendukung pengambilan data JSON secara langsung. Library atau framework yang bisa digunakan antara lain:
    -http: Library yang disediakan oleh Flutter untuk melakukan komunikasi HTTP. Library ini bisa digunakan untuk mengambil data JSON dari URL.
    -dart:convert: Library yang disediakan oleh Dart untuk melakukan konversi data dari format satu ke format lainnya. Library ini bisa digunakan untuk mengkonversi data JSON menjadi format Dart.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
  - CookieRequest adalah kelas yang disediakan oleh library HTTP untuk mengelola cookie dalam permintaan HTTP. Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar cookie dapat digunakan secara konsisten dan aman.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
  - Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter dapat dibagi menjadi beberapa langkah berikut:

    1. Membuat model
      Langkah pertama adalah membuat model yang sesuai dengan data JSON yang akan diambil. Model ini akan digunakan untuk mendeskripsikan struktur data JSON.

    2. Mengambil data JSON
      Langkah kedua adalah mengambil data JSON dari sumbernya. Sumber data JSON dapat berupa URL, file, atau database.

    3. Mengkonversi data JSON
      Langkah ketiga adalah mengkonversi data JSON menjadi format yang dapat dikenali oleh Flutter. Format data yang dapat dikenali oleh Flutter adalah Map<String, dynamic>.

    4. Menampilkan data
      Langkah terakhir adalah menampilkan data pada Flutter. Data dapat ditampilkan dengan berbagai cara, seperti menggunakan widget ListView, GridView, atau DataTable.

4.  Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  1. Input data pada akun flutter
    Pengguna memasukkan data akun, seperti nama pengguna dan kata sandi, pada aplikasi Flutter.
  2. Pembuatan permintaan HTTP
    Aplikasi Flutter membuat permintaan HTTP ke endpoint autentikasi Django. Permintaan HTTP ini berisi data akun yang telah dimasukkan oleh pengguna.
  3. Proses autentikasi oleh Django
    Django menerima permintaan HTTP dari Flutter dan melakukan proses autentikasi. Proses autentikasi ini terdiri dari dua langkah, yaitu:
      - Django memvalidasi data akun yang telah dimasukkan oleh pengguna. Jika data akun tidak valid, maka proses autentikasi akan gagal.
      - Django mencari akun yang sesuai dengan data akun yang telah dimasukkan oleh pengguna. Jika akun tidak ditemukan, maka proses autentikasi akan gagal.
  4. Pengembalian respons HTTP
    Jika proses autentikasi berhasil, maka Django akan mengembalikan respons HTTP yang berisi token autentikasi.
  5. Penerimaan respons HTTP
    Aplikasi Flutter menerima respons HTTP dari Django.
  6. Pemeriksaan token autentikasi
    Aplikasi Flutter memeriksa token autentikasi yang telah diterima dari Django. Jika token autentikasi tidak valid, maka aplikasi Flutter akan menampilkan pesan kesalahan.
  7. Simpan token autentikasi
    Jika token autentikasi valid, maka aplikasi Flutter menyimpan token autentikasi ke dalam variabel atau objek. Token autentikasi ini kemudian dapat digunakan untuk mengakses sumber daya yang dilindungi.
  8. Flutter menampilkan menu
    Aplikasi Flutter menampilkan menu yang hanya dapat diakses oleh pengguna yang telah terautentikasi.

5.  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
  - Provider: Widget ini digunakan untuk memberikan nilai ke widget keturunannya. Nilai ini dapat berupa objek, data, atau fungsi. Dalam kasus ini, nilai yang diberikan adalah objek CookieRequest. Objek ini dapat digunakan untuk mengelola cookie untuk permintaan HTTP.
  - MaterialApp:  Widget ini adalah widget akar dari aplikasi Flutter. Ini memberikan aplikasi dengan tema, navigasi aplikasi, dan fitur lainnya. Tema MaterialApp menentukan gaya visual dari aplikasi. Navigasi aplikasi menentukan cara pengguna berpindah antar layar dalam aplikasi.
  - LoginPage:  Widget ini adalah widget kustom yang mewakili layar login aplikasi. Kemungkinan didefinisikan dalam file terpisah yang disebut login.dart. Widget ini bertanggung jawab untuk menampilkan formulir login dan memproses input pengguna.
  - ColorScheme: Kelas ini digunakan untuk mendefinisikan skema warna untuk MaterialApp. Skema warna menentukan warna yang digunakan untuk berbagai elemen dalam aplikasi.
  - useMaterial3: Properti ini digunakan untuk menunjukkan apakah MaterialApp harus menggunakan bahasa desain Material 3. Mengatur properti ini ke true akan mengaktifkan fitur Material 3, seperti tema chip baru.
  - home: Properti ini digunakan untuk menentukan widget awal yang harus ditampilkan MaterialApp. Dalam kasus ini, widget awal adalah widget LoginPage.
  - Drawer: Widget ini digunakan untuk membuat laci navigasi. Laci navigasi adalah panel yang dapat dibuka dan ditutup, yang berisi daftar link atau tombol yang dapat digunakan untuk menavigasi antar layar dalam aplikasi.
  - ListView: Widget ini digunakan untuk membuat daftar item yang dapat di-scroll. Dalam kasus ini, daftar item terdiri dari tiga ListTile.
  - DrawerHeader: Widget ini digunakan untuk membuat header untuk laci navigasi. Header dapat berisi teks, gambar, atau widget lainnya.
  - Column: Widget ini digunakan untuk membuat tata letak yang terdiri dari beberapa widget yang ditumpuk secara vertikal. Dalam kasus ini, Column digunakan untuk menata letak header laci navigasi.
  - Text: Widget ini digunakan untuk menampilkan teks. Dalam kasus ini, Text digunakan untuk menampilkan judul dan subtitle laci navigasi.
  - Padding: Widget ini digunakan untuk menambahkan padding ke widget lainnya. Dalam kasus ini, Padding digunakan untuk menambahkan padding ke teks subtitle laci navigasi.
  - Icon: Widget ini digunakan untuk menampilkan ikon. Dalam kasus ini, Icon digunakan untuk menampilkan ikon di sebelah kiri setiap ListTile.
  - ListTile: Widget ini digunakan untuk membuat item daftar yang dapat di-tap. Dalam kasus ini, ListTile digunakan untuk membuat tiga item daftar yang mewakili tiga layar dalam aplikasi.
  - MaterialPageRoute: Widget ini digunakan untuk membuat rute navigasi yang menggunakan tema Material Design. Dalam kasus ini, MaterialPageRoute digunakan untuk membuat rute navigasi ke dua layar dalam aplikasi.
  - Scaffold: Widget ini adalah widget dasar untuk sebagian besar aplikasi Flutter. Ini menyediakan bagian judul, bagian aplikasi, tubuh, dan bagian navigasi bawah.
  - AppBar: Widget ini adalah bilah judul di bagian atas layar. Ini dapat berisi judul, ikon leading, dan widget trailing.
  - Drawer: Widget ini adalah panel geser yang dapat digunakan untuk bernavigasi antar bagian yang berbeda dari aplikasi.
  - SingleChildScrollView: Widget ini memungkinkan widget untuk scroll jika terdapat overflow dan ada ruang yang tersedia.
  - Text: Widget ini menampilkan teks.
  - GridView.count: Widget ini menampilkan grid widget anak, dengan jumlah kolom yang ditentukan.
  - InkWell: Widget ini membuat widget merespons ketukan.
  - SnackBar: Widget ini menampilkan pesan singkat di bagian bawah layar.
  - Material: Widget ini adalah blok bangunan dasar untuk widget yang ingin memiliki desain material.

6.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
  - Membuat django-app baru pada project django dengan nama authentication
  - Mendownload middleware corsheaders
  - Lalu membuat method login pada views.py pada aplikasi authentication
  - Menginstall package berikut pada flutter
  ```
  flutter pub add provider
  flutter pub add pbp_django_auth
  ```
  - Memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider.
  ```
      class MyApp extends StatelessWidget {
        const MyApp({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Provider(
                create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                },
                child: MaterialApp(
                    title: 'Flutter App',
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                        useMaterial3: true,
                    ),
                    home: MyHomePage()),
                ),
            );
        }
    }
  ```
  - Buat file baru pada folder `screens` dengan nama `login.dart` lalu isi dengan kode
  ```
  import 'package:shopping_list_task/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';

  void main() {
      runApp(const LoginApp());
  }

  class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Login',
          theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      );
      }
  }

  class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Login'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                              ),
                          ),
                          const SizedBox(height: 12.0),
                          TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                              ),
                              obscureText: true,
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                              onPressed: () async {
                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  // Cek kredensial
                                  // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                  // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                  // gunakan URL http://10.0.2.2/
                                  final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                  'username': username,
                                  'password': password,
                                  });
                      
                                  if (request.loggedIn) {
                                      String message = response['message'];
                                      String uname = response['username'];
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePage()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                              SnackBar(content: Text("$message Selamat datang, $uname.")));
                                      } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Text('Login Gagal'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                  TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                  ),
                                              ],
                                          ),
                                      );
                                  }
                              },
                              child: const Text('Login'),
                          ),
                      ],
                  ),
              ),
          );
      }
  }
  ```
  - Membuat model custom dengan mengambil data json dari project django dan meng-convertnya pada situs https://app.quicktype.io/
  - Menambahkan dependensi http pada flutter untuk fetch data dari django
  - Melakukan `flutter pub add http`
  - Menambahkan kode berikut pada `android/app/src/main/AndroidManifest.xml`
  ```
  ...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
    ...
  ```
  - Membuat file baru bernama `list_product.dart` pada folder screens
  - Isi file tersebut dengan kode berikut ini 
  ```
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:shopping_list_task/models/book_model.dart';
  import 'package:shopping_list_task/widgets/left_drawer.dart';

  class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);

      @override
      _ProductPageState createState() => _ProductPageState();
  }

  class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
      var url = Uri.parse(
          'http://127.0.0.1:8000/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Product
      List<Product> list_product = [];
      for (var d in data) {
          if (d != null) {
              list_product.add(Product.fromJson(d));
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
  - Menambahkan `list_produt.dart` ke left drawer
  - Mengintegrasi form flutter dengan project django dengan menambahkan kode berikut pada `main/views.py`
  ```
  @csrf_exempt
  def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Product.objects.create(
              user = request.user,
              name = data["name"],
              price = int(data["price"]),
              description = data["description"]
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
  ```
  - Membuat fitur logout pada aplikasi authentication django