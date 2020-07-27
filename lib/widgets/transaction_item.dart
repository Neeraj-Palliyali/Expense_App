import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.redAccent,
      Colors.blue,
      Colors.black,
      Colors.purple
    ];

    _bgColor=availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 5,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 49,
            child: Text('\$${widget.transaction.amount}'),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                textColor: Colors.green,
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.green,
                onPressed: () => widget.deleteTx(widget.transaction.id)),
      ),
    );
  }
}
