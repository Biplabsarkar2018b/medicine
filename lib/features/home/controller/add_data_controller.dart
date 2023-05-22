import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/apis/add_api.dart';

import '../../../constants/uiconstants.dart';
import '../view/home_view.dart';

final addDataProvider = StateNotifierProvider<AddData,bool>((ref) {
   return AddData(addAPI: ref.watch(addAPIProvider));
});

class AddData extends StateNotifier<bool> {
  final AddAPI _addAPI;
  AddData({required AddAPI addAPI})
      : _addAPI = addAPI,
        super(false);

  void adddata(
      {required String compartment,
      required String color,
      required String type,
      required String quantity,
      required String totalCount,
      required BuildContext context}) async {
    state = true;
    final res = await _addAPI.addMedicin(
      compartment: compartment,
      color: color,
      type: type,
      quantity: quantity,
      totalCount: totalCount,
    );
    state = false;
    res.fold((l) => showSnackBar(context, l.error), (r) {
      showSnackBar(context, 'Data Added ');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }
}
