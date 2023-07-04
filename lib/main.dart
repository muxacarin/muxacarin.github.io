import 'package:community_charts_flutter_demo/bar.dart';
import 'package:community_charts_flutter_demo/circle.dart';
import 'package:community_charts_flutter_demo/line.dart';
import 'package:community_charts_flutter_demo/pie.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int pageIndex = 0;

  final pageList = const [BarPage(), CirclePage(), PiePage(), LinePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              pageIndex = (pageIndex + 1) % pageList.length;
            });
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: pageList[pageIndex],
            ),
          ),
        ),
      ),
    );
  }
}
