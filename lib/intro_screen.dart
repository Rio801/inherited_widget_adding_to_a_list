import 'package:flutter/material.dart';
import 'package:inherited_widget_adding_to_a_list/fruit_provider_widget.dart';
import 'display_fruits_screen.dart';
import 'input_fruit_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return FruitProviderWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fruit Manager'),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: const [
            SafeArea(child: FruitAdd()),
            SafeArea(child: GetFruits()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Fruit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'View Fruits',
            ),
          ],
        ),
      ),
    );
  }
}
