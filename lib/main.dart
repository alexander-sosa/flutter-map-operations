import 'package:flutter/material.dart';
import 'package:maps/Map.dart';
import 'package:maps/ScreenWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget currentWidget = MainPresentation();

  Data dataObject = Data();
  Map<String, double> data;

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    dataObject.currentState();
    data = dataObject.vars;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Map Operations'), backgroundColor: Colors.cyan[700],
          actions: [menuPopUp()],
        ),

        backgroundColor: Colors.cyan[300],

        body: currentWidget,
      ),

    );
  }

  Widget menuPopUp(){
    return PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(child: Text('Home'), value: '0',),
          PopupMenuItem(child: Text('Current Map'), value: '1',),
          PopupMenuItem(child: Text('Operate...'), value: '2',)
        ],
      onSelected: (value){
          setState(() {
            switch(value){
              case '0':
                currentWidget = new MainPresentation();
                break;
              case '1':
                currentWidget = new Lista(dataObject.vars);
                break;
              case '2':
                currentWidget = new Operation(textEditingController, dataObject);
                break;
            }
          });
      },
    );
  }

}