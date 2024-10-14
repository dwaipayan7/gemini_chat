import 'package:flutter/material.dart';
import 'package:gemini_chat/screens/chat_history_screen.dart';
import 'package:gemini_chat/screens/chat_screen.dart';
import 'package:gemini_chat/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(); // PageController for navigating through pages.
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const ChatHistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    // Dispose of the page controller when not needed to prevent memory leaks.
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update the current index when the page changes.
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index when a tab is tapped.
          });
          // Use animateToPage for smooth scrolling instead of jumpToPage
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300), // Smooth transition duration
            curve: Curves.easeInOut, // Smooth animation curve
          );
        },
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Chat History',
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
