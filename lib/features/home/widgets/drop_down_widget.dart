import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
   String selectedValue = 'Option 1';

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: const [
          DropdownMenuItem(
            value: 'Option 1',
            child: Text('Option 1'),
          ),
          DropdownMenuItem(
            value: 'Option 2',
            child: Text('Option 2'),
          ),
          DropdownMenuItem(
            value: 'Option 3',
            child: Text('Option 3'),
          ),
        ],
      ),
    );
  }
}
