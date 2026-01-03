import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vision_social/features/auth/login_screen.dart';
import 'package:vision_social/features/feed/feed_screen.dart';
import 'package:vision_social/features/create/create_post_screen.dart';
import 'package:vision_social/features/chat/chat_list_screen.dart';
import 'package:vision_social/features/profile/profile_screen.dart';
import 'package:vision_social/shared/widgets/glass_container.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/feed',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(path: '/feed', builder: (context, state) => const FeedScreen()),
        GoRoute(path: '/create', builder: (context, state) => const CreatePostScreen()),
        GoRoute(path: '/chat', builder: (context, state) => const ChatListScreen()),
        GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1a0b2e), Colors.black, Color(0xFF050511)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
      bottomNavigationBar: const GlassBottomNavBar(),
    );
  }
}

class GlassBottomNavBar extends StatelessWidget {
  const GlassBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 70,
        child: GlassContainer(
          borderRadius: 35,
          color: Colors.black,
          opacity: 0.3,
          blur: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavBarItem(icon: Icons.home_rounded, path: '/feed'),
              _NavBarItem(icon: Icons.add_circle_outline_rounded, path: '/create'),
              _NavBarItem(icon: Icons.chat_bubble_outline_rounded, path: '/chat'),
              _NavBarItem(icon: Icons.person_outline_rounded, path: '/profile'),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String path;

  const _NavBarItem({required this.icon, required this.path});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final isSelected = location.startsWith(path);

    return GestureDetector(
      onTap: () => context.go(path),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              )
            : null,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.5),
          size: 28,
        ),
      ),
    );
  }
}
