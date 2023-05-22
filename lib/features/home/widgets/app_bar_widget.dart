import 'package:flutter/material.dart';

Widget appBarWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hi Harry!',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                wordSpacing: 2,
                letterSpacing: 3),
          ),
          Text('5 Medicines Left'),
        ],
      ),
      Row(
        children: const [
          Icon(
            Icons.medical_services_outlined,
            color: Colors.blue,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=436&q=80'),
          ),
        ],
      ),
    ],
  );
}
