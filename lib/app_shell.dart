import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/emerging_page.dart';
import 'pages/farm_size_page.dart';
import 'pages/home_page.dart';
import 'pages/patent_page.dart';
import 'pages/pitch_page.dart';
import 'pages/sites_page.dart';

class _Tab {
  const _Tab(this.label, this.title, this.icon, this.selectedIcon, this.page);
  final String label;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;
}

const _tabs = [
  _Tab('Home', 'Insulin from a plant', Icons.home_outlined, Icons.home, HomePage()),
  _Tab('Pitch', 'Pitch deck', Icons.slideshow_outlined, Icons.slideshow, PitchPage()),
  _Tab('Patent', 'The patent & IP', Icons.gavel_outlined, Icons.gavel, PatentPage()),
  _Tab('Farm', 'How much land?', Icons.agriculture_outlined, Icons.agriculture,
      FarmSizePage()),
  _Tab('Sites', 'Facilities that exist', Icons.factory_outlined, Icons.factory, SitesPage()),
  _Tab('Emerging', 'Other routes I follow', Icons.science_outlined, Icons.science,
      EmergingPage()),
];

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // `?tab=farm` (or patent, sites, emerging) opens straight to that tab, so a
  // link can point at one section.
  int _index = () {
    final want = Uri.base.queryParameters['tab']?.toLowerCase();
    if (want == null) return 0;
    final i = _tabs.indexWhere((t) => t.label.toLowerCase().startsWith(want));
    return i < 0 ? 0 : i;
  }();

  @override
  Widget build(BuildContext context) {
    final tab = _tabs[_index];
    return Scaffold(
      appBar: AppBar(
        title: Text(tab.title),
        actions: [
          IconButton(
            tooltip: 'About me',
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const AboutPage()),
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _index, children: [for (final t in _tabs) t.page]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          for (final t in _tabs)
            NavigationDestination(
              icon: Icon(t.icon),
              selectedIcon: Icon(t.selectedIcon),
              label: t.label,
            ),
        ],
      ),
    );
  }
}
