import 'package:flutter/material.dart';
import 'package:inn_sight/views/home/property_card.dart';

class HomePageUI extends StatelessWidget {
  const HomePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          title: const Text("InnSight"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search by city, area or hotel name",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text("Featured", style: theme.textTheme.titleLarge),
              const SizedBox(height: 12),

              // Featured properties
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Sample items
                  itemBuilder: (context, index) => const PropertyCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
