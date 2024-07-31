import 'package:flutter/material.dart';
class Estados extends StatefulWidget {
  final double tem, hum;
  const Estados({super.key, required this.tem, required this.hum});

  @override
  State<Estados> createState() => _EstadosState();
}

class _EstadosState extends State<Estados> {
late Widget msjT,msjH, msj;

  @override
  Widget build(BuildContext context) {

    if(widget.tem<0 || widget.tem==0){msjT=Text("hace frio", style: TextStyle(color: Colors.blue));}
    if(0<widget.tem && widget.tem<30){msjT=Text("esta agradable", style: TextStyle(color: Colors.green));}
    if(widget.tem>30){msjT=Text("la temperatura esta muy alta", style: TextStyle(color: Colors.red));}
    if(widget.hum<0 || widget.hum==0){msjH=Text("el tiempo es seco", style: TextStyle(color: Colors.brown));}
    if(widget.hum>0 && widget.hum<50){msjH=Text("esta humedad media", style: TextStyle(color: Colors.yellow));}
    if(widget.hum>50){msjH=Text("la humedad es alta", style: TextStyle(color: Colors.purple));}
    msj= Row(children: [msjT,Text(" | "),msjH],);
   return msj;

  }
}
