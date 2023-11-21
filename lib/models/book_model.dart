// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    int user;
    String bookName;
    String author;
    DateTime dateAdded;
    DateTime datePublished;
    int totalPages;
    int timesReaded;
    String description;

    Fields({
        required this.user,
        required this.bookName,
        required this.author,
        required this.dateAdded,
        required this.datePublished,
        required this.totalPages,
        required this.timesReaded,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        bookName: json["book_name"],
        author: json["author"],
        dateAdded: DateTime.parse(json["date_added"]),
        datePublished: DateTime.parse(json["date_published"]),
        totalPages: json["total_pages"],
        timesReaded: json["times_readed"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "book_name": bookName,
        "author": author,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "date_published": "${datePublished.year.toString().padLeft(4, '0')}-${datePublished.month.toString().padLeft(2, '0')}-${datePublished.day.toString().padLeft(2, '0')}",
        "total_pages": totalPages,
        "times_readed": timesReaded,
        "description": description,
    };
}
