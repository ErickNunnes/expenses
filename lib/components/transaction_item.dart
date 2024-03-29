import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;
  
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  

  @override
  Widget build(BuildContext context) {
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
  }
}