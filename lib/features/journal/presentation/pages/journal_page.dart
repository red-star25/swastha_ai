import 'package:flutter/material.dart';
import 'package:swastha_ai/common_widgets/app_bottom_nav_bar.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

import '../widgets/journal_empty_state.dart';
import '../widgets/journal_entry_list.dart';
import '../widgets/journal_entry_sheet.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final List<_JournalEntry> _entries = [
    _JournalEntry(
      text: 'Reflecting on my progress',
      date: DateTime(2024, 5, 12),
    ),
    _JournalEntry(text: 'Managing stress at work', date: DateTime(2024, 5, 5)),
    _JournalEntry(
      text: 'Finding joy in small things',
      date: DateTime(2024, 4, 28),
    ),
    _JournalEntry(text: 'Dealing with anxiety', date: DateTime(2024, 4, 21)),
    _JournalEntry(text: 'Building self-esteem', date: DateTime(2024, 4, 14)),
  ];

  void _showJournalEntrySheet({_JournalEntry? entry, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return JournalEntrySheet(
          initialText: entry?.text,
          isEditing: entry != null,
          onSave: (text) {
            setState(() {
              if (entry == null) {
                _entries.insert(
                  0,
                  _JournalEntry(text: text, date: DateTime.now()),
                );
              } else if (index != null) {
                _entries[index] = _JournalEntry(text: text, date: entry.date);
              }
            });
          },
        );
      },
    );
  }

  void _deleteEntry(int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Entry'),
            content: const Text(
              'Are you sure you want to delete this journal entry?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Color(0xFFB71C1C)),
                ),
              ),
            ],
          ),
    );
    if (confirm == true) {
      setState(() {
        _entries.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(selectedIndex: 1),
      appBar: AppBar(
        title: const Text('Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Entry',
            onPressed: () => _showJournalEntrySheet(),
          ),
        ],
      ),
      floatingActionButton:
          _entries.isNotEmpty
              ? FloatingActionButton(
                onPressed: () => _showJournalEntrySheet(),
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.add, color: Colors.white),
              )
              : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Past entries',
              style: AppTextTheme.h4.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 16),
            if (_entries.isEmpty)
              const Expanded(child: JournalEmptyState())
            else
              Expanded(
                child: JournalEntryList(
                  entries: _entries,
                  onEdit:
                      (index) => _showJournalEntrySheet(
                        entry: _entries[index],
                        index: index,
                      ),
                  onDelete: (index) => _deleteEntry(index),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _JournalEntry {
  final String text;
  final DateTime date;
  _JournalEntry({required this.text, required this.date});
}
