import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateProvider<int>((ref) {
  return 1;
});

class QuantityWidget extends ConsumerStatefulWidget {
  const QuantityWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends ConsumerState<QuantityWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final q = ref.watch(quantityProvider);

    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Take $q pill',
            textAlign: TextAlign.center,
          )),
          TextButton(
            onPressed: () {
              ref.read(quantityProvider.notifier).state--;
            },
            child: Icon(Icons.remove),
          ),
          TextButton(
            onPressed: () {
              ref.read(quantityProvider.notifier).state++;
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
