import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/constants/appconstants.dart';

final typeProvider = StateProvider<String>((ref) {
  return AppConstants.tablet;
});

class TypeWidget extends ConsumerWidget {
  const TypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(typeProvider);
    final List<String> images = [
      AppConstants.tablet,
      AppConstants.capsule,
      AppConstants.cream,
      AppConstants.liquid,
    ];
    return Container(
      height: 40, // Specify the desired height of the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4, // Number of items in the list
        itemBuilder: (context, index) {
          final image = images[index];
          return InkWell(
            onTap: () {
              ref.read(typeProvider.notifier).state = images[index];
            },
            child: Container(
              width: 40, // Width of each item
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.grey),
                image: DecorationImage(
                  colorFilter: t == images[index]
                      ? ColorFilter.mode(Colors.grey, BlendMode.colorBurn)
                      : ColorFilter.mode(Colors.transparent, BlendMode.color),
                  image: AssetImage(image),
                ),
                // borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
