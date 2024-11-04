import 'package:flutter/material.dart';
import 'package:inherited_widget_adding_to_a_list/fruit_provider_widget.dart';

import 'fruit_provider.dart';

class GetFruits extends StatelessWidget {
  const GetFruits({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = FruitProvider.of(context)?.fruits;
    return FruitProviderWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Fruits"),
        ),
        body: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries!.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                child: Center(
                    child: Text(
                        'Fruits\n ${entries[index].fruitName} : ${entries[index].quantity}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
