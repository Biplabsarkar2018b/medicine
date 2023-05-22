import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = StateProvider<int>((ref) {
  return 0;
});

class ColourWidget extends ConsumerWidget {
  const ColourWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(colorProvider);
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
    ];
    return Container(
      height: 40, // Specify the desired height of the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Number of items in the list
        itemBuilder: (context, index) {
          final color = colors[index];

          return InkWell(
            onTap: () {
              ref.read(colorProvider.notifier).state = index;
            },
            child: Container(
              width: 40, // Width of each item
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                    width: c == index ? 3 : 0,
                    color: c == index ? Colors.black : Colors.grey),
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
