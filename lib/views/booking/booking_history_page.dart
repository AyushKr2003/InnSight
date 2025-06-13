import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gold = theme.colorScheme.primary;

    // Sample booking data
    final bookings = [
      {
        'hotel': 'Palm Tree Resort',
        'location': 'Goa',
        'checkIn': '2025-07-15',
        'checkOut': '2025-07-20',
        'status': 'Confirmed',
      },
      {
        'hotel': 'City View Inn',
        'location': 'Mumbai',
        'checkIn': '2025-05-02',
        'checkOut': '2025-05-05',
        'status': 'Completed',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Booking History"),
        centerTitle: true,
      ),
      body:
          bookings.isEmpty
              ? Center(
                child: Text(
                  "No bookings yet.",
                  style: theme.textTheme.titleMedium,
                ),
              )
              : ListView.builder(
                itemCount: bookings.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.hotel, size: 36),
                      title: Text(
                        booking['hotel']!,
                        style: theme.textTheme.titleMedium,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking['location']!),
                          const SizedBox(height: 4),
                          Text(
                            "Check-in: ${booking['checkIn']} - Check-out: ${booking['checkOut']}",
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Status: ${booking['status']}",
                            style: TextStyle(
                              color:
                                  booking['status'] == 'Confirmed'
                                      ? gold
                                      : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to booking details if needed
                      },
                    ),
                  );
                },
              ),
    );
  }
}
