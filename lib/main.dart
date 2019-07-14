import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_load/progress_dialog.dart';
import 'loading_simple.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Load by Dark'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool visible = false;
  var globalKey = GlobalKey<ScaffoldState>();
  ProgressDialog progress = ProgressDialog.getProgressDialog("Gravando...");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: globalKey,
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Teste Progress"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    progress.showProgress();

                    Timer(Duration(seconds: 3), () {
                      progress.hideProgress();
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Teste Simple Loading"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });

                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        visible = !visible;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        progress,
        LoadingSimpleWidget(
          isVisible: visible,
          subTitle: "Gravando Dados...Aguarde...",
        )
      ],
    );
  }
}
