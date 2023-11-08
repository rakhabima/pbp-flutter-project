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
