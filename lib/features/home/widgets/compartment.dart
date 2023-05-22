import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compartmentProvider = StateProvider<int>((ref) {
  return 1;
});

class HorizontalNumberList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.watch(compartmentProvider);
    return Container(
      height: 40, // Specify the desired height of the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Number of items in the list
        itemBuilder: (context, index) {
          final number = index + 1;

          return InkWell(
            // splashFactory:,
            onTap: () {
               ref.read(compartmentProvider.notifier).state = number;
            },
            child: Container(
              width: 40, // Width of each item
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(width: cp==number ? 2 : 1, color: cp==number ? Colors.black : Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
