import 'package:flutter/material.dart';
import 'user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 50,
                child: TextField(
                  controller: titleController,
//                  onChanged: (val) => {titleInput = val},
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
//                  onChanged: (val) => amountInput = val,
                  controller: amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
              ),
              FlatButton(
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Add Transaction'),
                textColor: Colors.blue,
              )
            ],
          ),
        ));
  }
}
