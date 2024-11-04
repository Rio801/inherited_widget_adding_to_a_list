import 'package:flutter/material.dart';
import 'package:inherited_widget_adding_to_a_list/fruit_provider_widget.dart';
import 'package:inherited_widget_adding_to_a_list/intro_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FruitProviderWidget(
      child: MaterialApp(
        home: IntroScreen(),
      ),
    );
  }
}
