import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  bool isDarkMode = false;

  final List<String> pageTitles = [
    'Home Tab',
    'Search Tab',
    'Profile Tab',
  ];

  final List<IconData> pageIcons = [
    Icons.home,
    Icons.search,
    Icons.person,
  ];

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void changeTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void openDrawerPage(String title, IconData icon) {
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text('$title menu clicked'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Navigation & Theme'),
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.blue,
        actions: [
          Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
          Switch(
            value: isDarkMode,
            onChanged: changeTheme,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey.shade900 : Colors.blue,
              ),
              child: const Text(
                'Menu Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                openDrawerPage('Home', Icons.home);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                openDrawerPage('Settings', Icons.settings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                openDrawerPage('About', Icons.info);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              pageIcons[selectedIndex],
              size: 80,
              color: isDarkMode ? Colors.amber : Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              pageTitles[selectedIndex],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isDarkMode ? 'Dark mode is ON' : 'Light mode is ON',
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeTab,
        selectedItemColor: isDarkMode ? Colors.amber : Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
