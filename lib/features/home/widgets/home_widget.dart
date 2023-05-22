import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/appconstants.dart';
import 'app_bar_widget.dart';
import 'calender_widget.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      // Container(),
                      appBarWidget(),
                      const SizedBox(
                        height: 30,
                      ),
                      calenderWidget(),
                      Image.asset(
                        AppConstants.empty_box,
                      ),
                      const Text(
                        'Nothing is Here, Add a Medicine',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}