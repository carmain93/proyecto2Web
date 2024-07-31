import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rtdata/config/config.dart';
import 'package:rtdata/pantallas/GHume.dart';
import 'package:rtdata/pantallas/GTemp.dart';
import 'package:rtdata/pantallas/estados.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  double humidity = 0, temperature = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Gauge"),actions: <Widget>[
      IconButton(
      tooltip: 'Consultar',
      icon: const Icon(Icons.search),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Buscando datos")),);
        getData();
        },
    ),
      ],),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: GTemp(tem: temperature,)),
        const Divider(
          height: 5,
        ),
        Expanded(
            child: GHume(hum: humidity,),
            ),
        Estados(tem: temperature, hum: humidity),
        const Divider(
          height: 5,
        ),
        Row(children: [
          Text("Temperatura: $temperature"),
          Text("Humedad: $humidity"),


        ],)
      ],
    ));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    Timer.periodic(
      const Duration(seconds: 30),
      (timer) async {
        setState(() {
          temperature = 0;
          humidity = 0;
        });
        await getData();

      },
    );
  }

  Future<void> getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final temp = await ref.child("Living Room/temperature/value").get();
    final humi = await ref.child("Living Room/humidity/value").get();
    if (temp.exists && humi.exists) {
      temperature = double.parse(temp.value.toString());
      humidity = double.parse(humi.value.toString());
    } else {
      temperature = -1;
      humidity = -1;
    }
    setState(() {});
  }



}
