import 'package:crack_and_tell/features/calendar/presentation/pages/calendar_page.dart';
import 'package:crack_and_tell/features/home/presentation/pages/home_page.dart';
import 'package:crack_and_tell/features/insight/presentation/pages/insight_page.dart';
import 'package:crack_and_tell/features/journal/presentation/pages/journal_page.dart';
import 'package:crack_and_tell/features/main_tab_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainTabPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => HomePage()
        ),
        GoRoute(
          path: '/journal',
          builder: (context, state) => JournalPage()
        ),
        GoRoute(
          path: '/calendar',
          builder: (context, state) => CalendarPage()
        ),
        GoRoute(
          path: '/insight',
          builder: (context, state) => InsightPage()
        )
      ]
    )
    
  ]
);