import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testapp/dashboard.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController num = TextEditingController();
  TextEditingController password = TextEditingController();

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
            controller: num, decoration: InputDecoration(hintText: "number")),
        SizedBox(height: 20),
        TextField(
            controller: password,
            decoration: InputDecoration(hintText: "Password")),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              final response = await dio.post(
                  'https://parcel.cscodetech.com/de_api/dboy_login.php',
                  data: {'mobile': num.text, 'password': password.text});
              print(response);
              var mm = jsonDecode(response.data);
              responsedata aa = responsedata.fromJson(mm);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dashboard(aa.dboydata);
              },));
            },
            child: Text("Login")),
      ]),
    );
  }
}

class responsedata {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  responsedata(
      {this.dboydata,
      this.currency,
      this.responseCode,
      this.result,
      this.responseMsg});

  responsedata.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
      this.title,
      this.rimg,
      this.status,
      this.rate,
      this.lcode,
      this.fullAddress,
      this.pincode,
      this.landmark,
      this.commission,
      this.bankName,
      this.ifsc,
      this.receiptName,
      this.accNumber,
      this.paypalId,
      this.upiId,
      this.email,
      this.password,
      this.rstatus,
      this.mobile,
      this.accept,
      this.reject,
      this.complete,
      this.dzone,
      this.vehiid,
      this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }
}
