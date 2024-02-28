import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? 
    LayoutBuilder(builder:(ctx, constraints) {
      return Column(
      children: [
        const SizedBox(height: 20),
        Text(
        'Nenhuma transação cadastrada',
        style: Theme.of(context).textTheme.titleLarge,
              ),
      const SizedBox(height: 20),
      SizedBox(
        height: constraints.maxHeight * 0.6,
        child: Image.asset('assets/images/waiting.png',
        fit: BoxFit.cover,)
      )
    ],
  );
    })
    : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('R\$${tr.value}'),
                ),
              ),
            ),
            title: Text(
              tr.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(tr.date),
            ),
            trailing: MediaQuery.of(context).size.width > 480 ? 
            TextButton.icon(
              onPressed: () => onRemove(tr.id),
              icon: Icon(Icons.delete,
              color: Theme.of(context).colorScheme.error),
              label: Text(
                'Excluir',
                style: TextStyle(color: Theme.of(context).colorScheme.error)
              ))
            : IconButton(
              onPressed: () => onRemove(tr.id),
              icon: const Icon(Icons.delete_rounded),
              color: Theme.of(context).colorScheme.error,),
          ),
        );
      },
    );
  }
}