import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/apis/add_api.dart';
import 'package:medicine/constants/loadingpage.dart';
import 'package:medicine/features/home/controller/add_data_controller.dart';
import 'package:medicine/features/home/widgets/colour_widget.dart';
import 'package:medicine/features/home/widgets/date_picker.dart';
import 'package:medicine/features/home/widgets/date_widget.dart';
import 'package:medicine/features/home/widgets/drop_down_widget.dart';
import 'package:medicine/features/home/widgets/quantity_widget.dart';
import 'package:medicine/features/home/widgets/search_widget.dart';
import 'package:medicine/features/home/widgets/slider_widget.dart';
import 'package:medicine/features/home/widgets/type_widget.dart';

import 'compartment.dart';

class AddWidget extends ConsumerStatefulWidget {
  const AddWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends ConsumerState<AddWidget> {
  void dataAdd() {
    ref.read(addDataProvider.notifier).adddata(
          compartment: ref.read(compartmentProvider).toString(),
          color: ref.read(colorProvider).toString(),
          type: ref.read(typeProvider).toString(),
          quantity: ref.read(quantityProvider).toString(),
          totalCount: ref.read(sliderProvider).toString(),
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(addDataProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add Medicine',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading ? const LoadingPage() : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Compartment',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              HorizontalNumberList(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Colour',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              const ColourWidget(),
              const Text(
                'Type',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              const TypeWidget(),
              const Text(
                'Quantity',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              const QuantityWidget(),
              const Text(
                'Total Count',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              const SliderWidget(),
              Text('Set Date'),
              DateWidget(),
              const Text(
                'Frequency of Days',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              // DropDown(),

               Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: dataAdd,
                  child: Icon(
                    Icons.add,
                    color: Colors.amber,
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
