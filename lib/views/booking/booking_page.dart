import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gold = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text("Book Property"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Calendar View
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 90)),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: gold,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: gold.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            const SizedBox(height: 24),

            // Room Summary
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Room Type & Summary",
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.king_bed),
                title: const Text("Deluxe Room"),
                subtitle: const Text(
                  "1 King Bed, 2 Guests, Free Wi-Fi, Breakfast included",
                ),
                trailing: Text(
                  "₹2499",
                  style: theme.textTheme.titleMedium?.copyWith(color: gold),
                ),
              ),
            ),
            const Spacer(),

            // Confirm Booking Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    _selectedDay == null
                        ? null
                        : () {
                          // Proceed to booking confirmation logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Booking for ${DateFormat.yMMMd().format(_selectedDay!)}",
                              ),
                            ),
                          );
                        },
                child: const Text("Confirm Booking"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
