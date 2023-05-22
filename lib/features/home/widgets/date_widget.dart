import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/features/home/widgets/date_picker.dart';
import 'package:medicine/models/date_picker_model.dart';

final dateProvider = StateNotifierProvider<DateNotifierClass, DateModel>((ref) {
  return DateNotifierClass();
});

class DateWidget extends ConsumerStatefulWidget {
  const DateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends ConsumerState<DateWidget> {
  DateTime? _selectedDate;
  void startDatePick() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      // setState(() {
      //   // using state so that the UI will be rerendered when date is picked
      //   _selectedDate = pickedDate;
      // });
      print(pickedDate);
      ref.read(dateProvider.notifier).changeStartDate(pickedDate.toString());
    });
  }

  void endDatePick() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      // setState(() {
      //   // using state so that the UI will be rerendered when date is picked
      //   _selectedDate = pickedDate;
      // });
       print(pickedDate.toString());
      ref.read(dateProvider.notifier).changeEndDate(pickedDate.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dp = ref.watch(dateProvider);
    print(dp.endDate);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                      // _selectedDate != null
                      //     ? _selectedDate.toString()
                      //     : 'Add Date',
                      dp.startDate),
                  InkWell(
                      onTap: startDatePick,
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                      // _selectedDate != null
                      //     ? _selectedDate.toString()
                      //     : 'Add Date',
                      dp.endDate),
                  InkWell(
                      onTap: endDatePick, child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
