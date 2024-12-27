import 'package:flutter/material.dart';
import 'package:untitled7/precption_page.dart';
import 'package:untitled7/xray_reports_page.dart';
import 'package:untitled7/widgets/report_card.dart';
import 'clinic_report_page.dart';

class MedicalReportsPage extends StatelessWidget {
  const MedicalReportsPage({super.key});

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
          'Medical Reports',
          style: TextStyle(
            color: Color(0xFF00B894),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReportCard(
              title: 'X-Ray Reports',
              imagePath: 'assets/img.png',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  XRayReportsScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ReportCard(
              title: 'Clinical Reports',
              imagePath: 'assets/img_1.png',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClinicalReportsPage(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ReportCard(
              title: 'Prescriptions',
              imagePath: 'assets/5841878.png',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrescriptionsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}