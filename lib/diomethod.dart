import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioMethod extends StatefulWidget {
  const DioMethod({Key? key});

  @override
  State<DioMethod> createState() => _DioMethodState();
}

class _DioMethodState extends State<DioMethod> {
  final dio = Dio(BaseOptions(responseType: ResponseType.plain));
  jsondata? jData;
  int a = 0;
  bool getdata = false;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      print(response.data);
      var map = jsonDecode(response.data);

      setState(() {
        jData = jsondata.fromJson(map);
        a = jData?.products?.length ?? 0;
        getdata = true;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getdata
            ? ListView.builder(
          shrinkWrap: true,
          itemCount: a,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: Text("${jData?.products?[index].title}"),
              leading: Image.network("${jData?.products?[index].thumbnail}"),
            );
          },
        )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class jsondata {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  jsondata({this.products, this.total, this.skip, this.limit});

  jsondata.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  dynamic discountPercentage;
  dynamic rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = List<String>.from(json['images']?.map((x) => x.toString()) ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    return data;
  }
}
