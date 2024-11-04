import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Fruits {
  String fruitName;
  int quantity;

  Fruits({required this.fruitName, required this.quantity});
}

class FruitProvider extends InheritedWidget {
  final List<Fruits> fruits;
  final void Function(Fruits) addFruit;
  final void Function(int) removeFruit;
  final Widget widgetChild;

  const FruitProvider(
      {super.key,
      required this.fruits,
      required this.addFruit,
      required this.removeFruit,
      required this.widgetChild})
      : super(child: widgetChild);

  static FruitProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FruitProvider>();
  }

  @override
  bool updateShouldNotify(FruitProvider oldWidget) {
    return oldWidget.fruits.length != fruits.length ||
        !const ListEquality().equals(oldWidget.fruits, fruits);
  }
}
