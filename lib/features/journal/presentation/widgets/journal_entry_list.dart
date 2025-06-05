import 'package:flutter/material.dart';

import 'journal_entry_row.dart';

class JournalEntryList extends StatelessWidget {
  final List<dynamic> entries;
  final void Function(int) onEdit;
  final void Function(int) onDelete;

  const JournalEntryList({
    super.key,
    required this.entries,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final entry = entries[index];
        return JournalEntryRow(
          text: entry.text,
          date: entry.date,
          onEdit: () => onEdit(index),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
