import 'package:flutter/material.dart';
import 'medical_reports_page.dart';
import 'medicine_list_page.dart';
import 'symptom_checker_page.dart';
import '../widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/img_2.png', height: 24),
                      const Text(
                        'Hi Frank!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00B894),
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/img_3.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    MenuCard(
                      title: 'DashBoard',
                      imagePath: 'assets/img_4.png',
                      onTap: () {},
                    ),
                    MenuCard(
                      title: 'Medical Reports',
                      imagePath: 'assets/8206501.png',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicalReportsPage(),
                        ),
                      ),
                    ),
                    MenuCard(
                      title: 'Medicine Store Section',
                      imagePath: 'assets/1354746d12ec0c590c7ee43ad142024a.jpg',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (context) => const MedicineListPage(),
                        ),
                      ),
                    ),
                    MenuCard(
                      title: 'Symptom Checker',
                      imagePath: 'assets/img_5.png',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SymptomCheckerPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xFF00B894),
                unselectedItemColor: Colors.grey,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    label: 'Calendar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}

