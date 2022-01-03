import 'package:flutter/material.dart';
import 'dart:math';

import 'package:maps/Map.dart';

class MainPresentation extends StatefulWidget{
  @override
  _MainPresentationState createState() => _MainPresentationState();
}

class _MainPresentationState extends State<MainPresentation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Map Operations!', style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Select an option from the menu to start', style: TextStyle(fontSize: 16, color: Colors.black),)
          ],
        ),
      ),
    );
  }
}


class Lista extends StatefulWidget{

  Map<String, double> data;
  Lista(this.data);

  @override
  _ListaState createState() => _ListaState(data);
}

class _ListaState extends State<Lista> {

  Map<String, double> data;
  _ListaState(this.data);

  List<Color> colors300 = [Colors.pink[300], Colors.green[300], Colors.yellow[300], Colors.red[300], Colors.lime[300], Colors.teal[300], Colors.amber[300], Colors.blue[300], Colors.deepOrange[300], Colors.deepPurple[300], Colors.indigo[300], Colors.purple[300]];
  List<Color> colors600 = [Colors.pink[600], Colors.green[600], Colors.yellow[600], Colors.red[600], Colors.lime[600], Colors.teal[600], Colors.amber[600], Colors.blue[600], Colors.deepOrange[600], Colors.deepPurple[600], Colors.indigo[600], Colors.purple[600]];
  List<Color> colors800 = [Colors.pink[800], Colors.green[800], Colors.yellow[800], Colors.red[800], Colors.lime[800], Colors.teal[800], Colors.amber[800], Colors.blue[800], Colors.deepOrange[800], Colors.deepPurple[800], Colors.indigo[800], Colors.purple[800]];
  List<Color> colors900 = [Colors.pink[900], Colors.green[900], Colors.yellow[900], Colors.red[900], Colors.lime[900], Colors.teal[900], Colors.amber[900], Colors.blue[900], Colors.deepOrange[900], Colors.deepPurple[900], Colors.indigo[900], Colors.purple[900]];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Center(child: Text('Elementos actuales del mapa: ', style: TextStyle(fontSize: 20, fontFamily: "Roboto"),))),
        Expanded(
          flex: 14,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: fill()
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> fill(){
    List <Widget> wids = [];
    data.forEach((key, value) => wids.add(element("$key = $value")));
    return wids;
  }

  Widget element(String info){
    var rnd = new Random();
    int randomColor = rnd.nextInt(colors300.length);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                colors300[randomColor],
                colors600[randomColor],
                colors800[randomColor],
              ]),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: colors900[randomColor])
          ),

          child: Center(
            child: Text(info, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}


class Operation extends StatefulWidget{
  Data dataObject;
  TextEditingController tec1 = new TextEditingController();
  Operation(this.tec1, this.dataObject);

  @override
  _OperationState createState() => _OperationState(tec1, dataObject);
}

class _OperationState extends State<Operation> {
  Data dataObject;
  TextEditingController tec1 = new TextEditingController();
  _OperationState(this.tec1, this.dataObject);

  Widget resp = Text('');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text('Enter the operation:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          resp,
          SizedBox(height: 10,),
          TextField(controller: widget.tec1, decoration: InputDecoration(hintText: 'ex.: x = a + b'),),
          SizedBox(height: 15,),
          button(),
        ],
      ),
    );
  }

  Widget button(){
    return FlatButton(onPressed: (){
      setState(() {
        String stmt = tec1.text;
        // Start checking for bad input
        if(!stmt.contains('=')){
          resp = Text('Bad parameters! Check your input', style: TextStyle(fontSize: 15, color: Colors.redAccent),);
          return;
        }
        if(!stmt.contains('+') && !stmt.contains('-') && !stmt.contains('/') && !stmt.contains('*')){
          resp = Text('Bad parameters! Check your input', style: TextStyle(fontSize: 15, color: Colors.redAccent),);
          return;
        }
        String result = dataObject.operate(stmt);
        if(result == 'error'){
          resp = Text('Bad parameters! Check your input', style: TextStyle(fontSize: 15, color: Colors.redAccent),);
          return;
        }
        resp = Text('Done! Check the list', style: TextStyle(fontSize: 15, color: Colors.lightGreenAccent),);
        tec1.clear();
      });
    }, child: Container(
      width: 100,
      height: 30,
      color: Colors.black,
      child: Center(
        child: Text('Operate!', style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    ));
  }
}