import 'package:flutter/material.dart';
import 'package:testapp/firstpage.dart';

class Dashboard extends StatefulWidget {
  Dboydata? dboydata;

  Dashboard(Dboydata? this.dboydata, {super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Text("title:${widget.dboydata!.title}"),
          Image.network("rimg:${widget.dboydata!.rimg}"),
          Text("status:${widget.dboydata!.status}"),
          Text("rate:${widget.dboydata!.rate}"),
          Text("lcode:${widget.dboydata!.lcode}"),
          Text("full address:${widget.dboydata!.fullAddress}"),
          Text("pincode:${widget.dboydata!.pincode}"),
          Text("landmark:${widget.dboydata!.landmark}"),
        ]),
      ),
    );
  }
}
