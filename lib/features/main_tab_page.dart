import 'package:crack_and_tell/features/calendar/presentation/pages/calendar_page.dart';
import 'package:crack_and_tell/features/home/presentation/pages/home_page.dart';
import 'package:crack_and_tell/features/insight/presentation/pages/insight_page.dart';
import 'package:crack_and_tell/features/journal/presentation/pages/journal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MainTabPage extends StatelessWidget {
  const MainTabPage({ super.key, required this.child });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location.startsWith('/journal')) currentIndex = 1;
    if (location.startsWith('/calendar')) currentIndex = 2;
    if (location.startsWith('/insight')) currentIndex = 3;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          // setState(() {
          //   _currentIndex = index;
          // });
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/journal');
              break;
            case 2:
              context.go('/calendar');
              break;
            case 3:
              context.go('/insight');
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pencil_outline),
            label: 'Journal'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            label: 'Insight'
          ),
        ]
      )
    );
  }
}

