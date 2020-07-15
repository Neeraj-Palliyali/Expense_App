import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body:  ListView(
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Container(
                  width: double.infinity,
                  child: Text("Chart"),
                ),
              ),
              UserTransactions(),
            ],
          ),
        );
  }
}
