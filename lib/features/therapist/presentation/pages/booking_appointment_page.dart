import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/features/therapist/presentation/pages/confirm_appointment_page.dart';

import '../widgets/available_times_chips.dart';
import '../widgets/booking_calendar.dart';
import '../widgets/booking_continue_button.dart';

class BookingAppointmentPage extends StatefulWidget {
  const BookingAppointmentPage({super.key});

  @override
  State<BookingAppointmentPage> createState() => _BookingAppointmentPageState();
}

class _BookingAppointmentPageState extends State<BookingAppointmentPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final List<String> _availableTimes = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
    '10:00 PM',
  ];
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Select date & time', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              BookingCalendar(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay,
                onDaySelected: (selectedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = selectedDay;
                  });
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Available times',
                style: AppTextTheme.h4.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              AvailableTimesChips(
                times: _availableTimes,
                selectedTime: _selectedTime,
                onSelected: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 24),
              BookingContinueButton(
                enabled: _selectedDay != null && _selectedTime != null,
                onPressed:
                    (_selectedDay != null && _selectedTime != null)
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ConfirmAppointmentPage(
                                    therapistName: 'Dr. Sarah Miller',
                                    therapistImage:
                                        'assets/images/therapist.png',
                                    selectedDate: _selectedDay!,
                                    selectedTime: _selectedTime!,
                                  ),
                            ),
                          );
                        }
                        : null,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
