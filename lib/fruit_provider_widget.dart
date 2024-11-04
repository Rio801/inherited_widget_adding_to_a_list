import 'package:flutter/material.dart';
import 'package:inherited_widget_adding_to_a_list/fruit_provider.dart';

class FruitProviderWidget extends StatefulWidget {
  final Widget child;
  const FruitProviderWidget({super.key, required this.child});

  @override
  State<FruitProviderWidget> createState() => _FruitProviderWidgetState();
}

class _FruitProviderWidgetState extends State<FruitProviderWidget> {
  List<Fruits> fruit = [];

  void addFruit(Fruits f) {
    setState(() {
      fruit.add(f);
    });
  }

  void removeFruit(int index) {
    setState(() {
      fruit.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FruitProvider(
        fruits: fruit,
        addFruit: addFruit,
        removeFruit: removeFruit,
        widgetChild: widget.child);
  }
}
