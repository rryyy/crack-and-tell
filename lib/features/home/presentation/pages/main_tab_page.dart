import 'package:crack_and_tell/features/home/presentation/pages/calendar_page.dart';
import 'package:crack_and_tell/features/home/presentation/pages/home_page.dart';
import 'package:crack_and_tell/features/home/presentation/pages/insight_page.dart';
import 'package:crack_and_tell/features/home/presentation/pages/journal_page.dart';
import 'package:flutter/material.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    JournalPage(),
    CalendarPage(),
    InsightPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps ALL pages alive in memory even when not visible.
      // This means your scroll position and state is preserved when you switch tabs.
      // Without this, each tab would rebuild from scratch every time.
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _buildTabItem(
            label: 'Home',
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            index: 0
          ),
          _buildTabItem(
            label: 'Journal',
            icon: Icons.book_online_outlined,
            activeIcon: Icons.book_online_rounded,
            index: 1
          ),
          _buildTabItem(
            label: 'Calendar',
            icon: Icons.calendar_month_outlined,
            activeIcon: Icons.calendar_month_rounded,
            index: 2
          ),
          _buildTabItem(
            label: 'Insight',
            icon: Icons.insights_outlined,
            activeIcon: Icons.insights_rounded,
            index: 3
          )
        ]
      )
    );
  }

  // This helper method builds each BottomNavigationBarItem.
  // We check _currentIndex to decide which image version to show.
  BottomNavigationBarItem _buildTabItem({
    required String label,
    required IconData icon,
    required IconData activeIcon,
    required int index
  }) {
    final bool isActive = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Icon(
      isActive ? activeIcon : icon,
      size: 25.0,
    ),
      label: label,
    );
  }
}

