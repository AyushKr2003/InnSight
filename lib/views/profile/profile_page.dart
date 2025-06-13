import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gold = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: gold,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Name
            Text("Ayush Singh", style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text("ayush@example.com", style: theme.textTheme.bodyMedium),

            const SizedBox(height: 24),

            // Editable Information
            buildInfoTile(Icons.phone, "Phone", "+91 9876543210"),
            buildInfoTile(Icons.location_on, "Location", "Punjab, India"),
            buildInfoTile(Icons.language, "Language", "English"),

            const Spacer(),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle logout logic
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.edit, size: 20),
          onTap: () {
            // Navigate to edit page or show dialog
          },
        ),
        const Divider(),
      ],
    );
  }
}
