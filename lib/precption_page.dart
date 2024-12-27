import 'package:flutter/material.dart';

class PrescriptionsPage extends StatelessWidget {
  const PrescriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF00B894)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Prescriptions',
          style: TextStyle(
            color: Color(0xFF00B894),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: 4, // Number of prescriptions
        itemBuilder: (context, index) {
          return const PrescriptionCard(date: '12/12/24');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new prescription functionality
        },
        backgroundColor: const Color(0xFF00B894),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  final String date;

  const PrescriptionCard({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Date - $date',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}