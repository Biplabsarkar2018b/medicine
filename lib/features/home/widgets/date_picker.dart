import 'package:flutter/material.dart';

class DatePickerContainer extends StatefulWidget {


  @override
  _DatePickerContainerState createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  

  DateTime? _selectedDate;
  void _presentDatePicker() {
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
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 40,
      child: Row(
        children: [
          Text(
            _selectedDate != null ? _selectedDate.toString() : 'Add Date',
          ),
          InkWell(
              onTap: _presentDatePicker, child: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
