import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 20,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(transactions[index].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
