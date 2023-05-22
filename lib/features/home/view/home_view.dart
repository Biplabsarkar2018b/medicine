import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/constants/appconstants.dart';
import 'package:medicine/core/provider.dart';
import 'package:medicine/features/home/controller/connectivity_controller.dart';
import 'package:medicine/features/home/widgets/add_widget.dart';
import 'package:medicine/features/home/widgets/app_bar_widget.dart';
import 'package:medicine/features/home/widgets/calender_widget.dart';
import 'package:medicine/features/home/widgets/home_widget.dart';
import 'package:medicine/features/home/widgets/report_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _page = 0;
  List<Widget> pages = [
    const HomeWidget(),
    const AddWidget(),
    const ReportWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    final connection = ref.watch(connectivityStatusProviders);
    return Scaffold(
      // appBar: AppBar(
      //   leading: Column(
      //     children: [
      //       Text('Hi Harry!'),
      //       Text('5 Medicines Left'),
      //     ],
      //   ),
      // ),
      body: connection == ConnectivityStatus.isConnected
          ? pages[_page]
          : const Center(
              child: AlertDialog(
                backgroundColor: Colors.amber,
                title: Text("Not Connected"),
                content: Text("You lost internet"),
              ),
            ),
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) {
            setState(() {
              _page = value;
            });
          },
          index: 1,
          // height: 25,
          animationDuration: const Duration(milliseconds: 100),
          animationCurve: Curves.fastOutSlowIn,
          backgroundColor: Colors.white,
          color: Colors.amber,
          buttonBackgroundColor: Colors.black,
          items: const [
            Icon(Icons.home, size: 50, color: Colors.blue),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
            Icon(
              Icons.bar_chart,
              size: 50,
              color: Colors.white,
            ),
          ]),
    );
  }
}
