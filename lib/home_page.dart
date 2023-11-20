import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project5/account_page.dart';
import 'package:riverpod_project5/gallery_page.dart';
import 'package:riverpod_project5/home_page2.dart';
import 'package:riverpod_project5/navigation_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationNotifierProvider);
    return Scaffold(
      body: [
        const HomePage2(),
        const GalleryPage(),
        const AccountPage(),
      ][index as int],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.browse_gallery),
            icon: Icon(Icons.browse_gallery_outlined),
            label: 'Gallery',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
        selectedIndex: index as int,
        indicatorColor: Colors.deepPurple.shade200,
        onDestinationSelected: (value) {
          ref.read(navigationNotifierProvider.notifier).setSelectedIndex(value);
        },
      ),
    );
  }
}
