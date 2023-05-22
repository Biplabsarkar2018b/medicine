// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class AddMedicine {
  final String compartment;
  final String color;
  final String type;
  final String quantity;
  final String count;
  final String startDate;
  final String endDate;
  const AddMedicine({
    required this.compartment,
    required this.color,
    required this.type,
    required this.quantity,
    required this.count,
    required this.startDate,
    required this.endDate,
  });

  AddMedicine copyWith({
    String? compartment,
    String? color,
    String? type,
    String? quantity,
    String? count,
    String? startDate,
    String? endDate,
  }) {
    return AddMedicine(
      compartment: compartment ?? this.compartment,
      color: color ?? this.color,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      count: count ?? this.count,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'compartment': compartment,
      'color': color,
      'type': type,
      'quantity': quantity,
      'count': count,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory AddMedicine.fromMap(Map<String, dynamic> map) {
    return AddMedicine(
      compartment: map['compartment'] as String,
      color: map['color'] as String,
      type: map['type'] as String,
      quantity: map['quantity'] as String,
      count: map['count'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMedicine.fromJson(String source) => AddMedicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddMedicine(compartment: $compartment, color: $color, type: $type, quantity: $quantity, count: $count, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant AddMedicine other) {
    if (identical(this, other)) return true;
  
    return 
      other.compartment == compartment &&
      other.color == color &&
      other.type == type &&
      other.quantity == quantity &&
      other.count == count &&
      other.startDate == startDate &&
      other.endDate == endDate;
  }

  @override
  int get hashCode {
    return compartment.hashCode ^
      color.hashCode ^
      type.hashCode ^
      quantity.hashCode ^
      count.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
  }
}
