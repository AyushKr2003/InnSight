import 'package:flutter/material.dart';
import 'package:inn_sight/views/booking/booking_page.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Property Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property image (placeholder)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              "Modern Hotel Room",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            Text("City Center, Chandigarh", style: theme.textTheme.bodyMedium),

            const SizedBox(height: 16),

            // Price
            Text(
              "₹2,500 / night",
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              "This modern room offers luxury, comfort, and all the amenities you need for a relaxing stay. Includes free Wi-Fi, air conditioning, a king-size bed, and a great view.",
              style: theme.textTheme.bodyLarge,
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BookingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
