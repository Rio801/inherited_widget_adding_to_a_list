import 'package:flutter/material.dart';
import 'package:inherited_widget_adding_to_a_list/display_fruits_screen.dart';

import 'fruit_provider.dart';

class FruitAdd extends StatefulWidget {
  const FruitAdd({super.key});

  @override
  State<FruitAdd> createState() => _FruitAddState();
}

class _FruitAddState extends State<FruitAdd> {
  int _currentPageIndex = 0;
  final Fruits _fru = Fruits(fruitName: '', quantity: 0);
  static const List<
      ({
        Widget page,
        String label,
        IconData icon,
      })> _pageNavItems = [
    (page: SafeArea(child: Placeholder()), label: "Add", icon: Icons.home),
    (
      page: SafeArea(child: GetFruits()),
      label: "Fruits",
      icon: Icons.free_breakfast_outlined,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fruitData = FruitProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fruit'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.food_bank_outlined),
                  labelText: 'Fruit Name',
                  hintText: 'What is your favorite fruit?'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a fruit name';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _fru.fruitName = value;
                });
              },
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _fru.quantity = int.tryParse(value) ??
                        0; // Default to 0 if parsing fails
                  });
                }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                fruitData?.addFruit(_fru);
              },
              child: const Text('Add Fruit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
        items: _pageNavItems
            .map((navItem) => BottomNavigationBarItem(
                  icon: Icon(navItem.icon),
                  label: navItem.label,
                ))
            .toList(),
      ),
    );
  }
}
