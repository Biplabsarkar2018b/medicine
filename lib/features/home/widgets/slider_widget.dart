import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<int>((ref) {
  return 1;
});

class SliderWidget extends ConsumerStatefulWidget {
  const SliderWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends ConsumerState<SliderWidget> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(sliderProvider);
    return Container(
      width: double.infinity,
      // height: 6
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: s.toDouble(),
            min: 1,
            max: 100,
            onChanged: (newValue) {
              ref.read(sliderProvider.notifier).state = newValue.toInt();
            },
          ),
          Text(
            'Value: ${s.toInt()}',
            // style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
