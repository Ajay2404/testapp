import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/diomethod.dart';

void main() {
  runApp(const MaterialApp(
    home: DioMethod(),
  ));
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   jsondata? jData;
//   int a = 0;
//   bool getdata = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: getdata
//           ? ListView.builder(
//               shrinkWrap: true,
//               itemCount: a,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   trailing: Text("${jData!.products![index].title}"),
//                   leading:
//                       Image.network("${jData!.products![index].thumbnail}"),
//                 );
//               },
//             )
//           : Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   var url = Uri.parse('https://dummyjson.com/products');
//                   var response = await http.get(url);
//                   print('Response status: ${response.statusCode}');
//                   print('Response body: ${response.body}');
//                   var map = jsonDecode(response.body);
//                   jData = jsondata.fromJson(map);
//                   a = jData!.products!.length;
//                   setState(() {
//                     getdata = true;
//                   });
//                 },
//                 child: Text("Get Data"),
//               ),
//             ),
//     );
//   }
// }


