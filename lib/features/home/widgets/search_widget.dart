import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: const TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          hintText: 'Search Medicine Name',
          enabledBorder: InputBorder.none,
          // focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,),
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
