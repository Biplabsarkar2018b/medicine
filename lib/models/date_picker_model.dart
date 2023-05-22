// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateModel {
  final String startDate;
  final String endDate;
  DateModel({
    required this.startDate,
    required this.endDate,
  });

  DateModel copyWith({
    String? startDate,
    String? endDate,
  }) {
    return DateModel(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DateModel.fromJson(String source) =>
      DateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DateModel(startDate: $startDate, endDate: $endDate)';

  @override
  bool operator ==(covariant DateModel other) {
    if (identical(this, other)) return true;

    return other.startDate == startDate && other.endDate == endDate;
  }

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode;
}

class DateNotifierClass extends StateNotifier<DateModel> {
  DateNotifierClass():super(DateModel(startDate: 'Start Date', endDate: 'End Date'));

  void changeStartDate(String startDate) {
    // print(startDate);
    state.copyWith(startDate: startDate);
  }

  void changeEndDate(String endDate) {
    // print(endDate);
    state.copyWith(endDate: endDate);
  }
}
