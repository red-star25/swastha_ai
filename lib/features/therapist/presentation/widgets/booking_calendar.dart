import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final ValueChanged<DateTime> onDaySelected;

  const BookingCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay);
      },
      enabledDayPredicate: (day) {
        final now = DateTime.now();
        return !day.isBefore(DateTime(now.year, now.month, now.day));
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.grey,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
        weekendTextStyle: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
        selectedTextStyle: AppTextTheme.bodyMedium.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        disabledTextStyle: AppTextTheme.bodyMedium.copyWith(
          color: Colors.grey.shade400,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: AppTextTheme.h4.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leftChevronIcon: const Icon(
          Icons.chevron_left,
          size: 28,
          color: Colors.black,
        ),
        rightChevronIcon: const Icon(
          Icons.chevron_right,
          size: 28,
          color: Colors.black,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTextTheme.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
        weekendStyle: AppTextTheme.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      calendarFormat: CalendarFormat.month,
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekHeight: 32,
    );
  }
}
