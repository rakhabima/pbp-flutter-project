import 'package:flutter/material.dart';
import 'package:shopping_list_task/models/book_model.dart';
import 'package:shopping_list_task/widgets/left_drawer.dart';

class BookListPage extends StatelessWidget {
  final List<Book> itemList; 

  const BookListPage({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        backgroundColor: Colors.black,
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
              title: Text('$itemList[index].bookName'),
              subtitle: Text('by: $itemList[index].author'),
              onTap: () {
                // Menampilkan popup dengan informasi barang yang di-klik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(itemList[index].bookName),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Date Published: ${itemList[index].datePublished}'),
                          Text('Total Pages: ${itemList[index].totalPages}'),
                          Text('Times Readed: ${itemList[index].timesReaded}'),
                          Text('Book Description: ${itemList[index].description}'),
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