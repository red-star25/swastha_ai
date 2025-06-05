import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class JournalEntryRow extends StatelessWidget {
  final String text;
  final DateTime date;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const JournalEntryRow({
    super.key,
    required this.text,
    required this.date,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onEdit,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.sticky_note_2_outlined,
              size: 28,
              color: Color(0xFF222B45),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: onEdit,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.split('\n').first,
                  style: AppTextTheme.h4.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('MMMM d, yyyy').format(date),
                  style: AppTextTheme.bodyMedium.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Color(0xFFB71C1C)),
          tooltip: 'Delete',
          onPressed: onDelete,
        ),
      ],
    );
  }
}
