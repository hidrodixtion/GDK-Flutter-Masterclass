import 'package:flutter/material.dart';

import 'package:gdk_flutter/second_page.dart';

import 'package:gdk_flutter/widget_angka.dart';

class GdkPage extends StatefulWidget {
  final String title;

  GdkPage(this.title);

  @override
  GdkPageState createState() {
    return new GdkPageState();
  }
}

class GdkPageState extends State<GdkPage> {
  var angka = 0;

  void _setAngka(int value) {
    setState(() {
      angka = value;
    });
  }

  void _openSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Saya di Body",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Icon(
              Icons.phone,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            WidgetAngka(
              angka,
              () => _setAngka(0),
            ),
            RaisedButton(
              onPressed: () => _setAngka(angka + 1),
              child: Text("Tambah"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSecondPage(),
        child: Icon(Icons.remove),
      ),
    );
  }
}
