import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class BarPage extends StatelessWidget {
  const BarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Bar Chart'),
        Expanded(
            child: charts.BarChart(
          _createSampleData(),
          barRendererDecorator: charts.BarLabelDecorator<String>(
              labelPosition: charts.BarLabelPosition.outside),
          domainAxis: const charts.AxisSpec<String>(
            renderSpec: charts.SmallTickRendererSpec<String>(
              labelStyle: charts.TextStyleSpec(
                fontSize: 10,
                color: charts.MaterialPalette.black,
              ),
              axisLineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.black,
              ),
            ),
          ),
        )),
      ],
    );
  }

  static List<charts.Series<ExampleData, String>> _createSampleData() {
    final data = [
      ExampleData('01/01/2023', 256),
      ExampleData('01/08/2023', 557),
      ExampleData('01/15/2023', 2341),
      ExampleData('01/22/2023', 2156),
      ExampleData('01/29/2023', 3849),
      ExampleData('02/05/2023', 4064),
      ExampleData('02/12/2023', 2500),
      ExampleData('02/19/2023', 554),
      ExampleData('02/26/2023', 1438),
      ExampleData('03/05/2023', 3686),
      ExampleData('03/12/2023', 3154),
      ExampleData('03/19/2023', 2573),
      ExampleData('03/26/2023', 2661),
      ExampleData('04/02/2023', 1307),
      ExampleData('04/09/2023', 3992),
      ExampleData('04/16/2023', 147),
      ExampleData('04/23/2023', 3707),
      ExampleData('04/30/2023', 1307),
      ExampleData('05/07/2023', 1656),
      ExampleData('05/14/2023', 1290),
      ExampleData('05/21/2023', 3130),
      ExampleData('05/28/2023', 1364),
      ExampleData('06/04/2023', 1817),
      ExampleData('06/11/2023', 3577),
      ExampleData('06/18/2023', 1983),
      ExampleData('06/25/2023', 512),
      ExampleData('07/02/2023', 3775),
      ExampleData('07/09/2023', 1806),
      ExampleData('07/16/2023', 3207),
    ];

    return [
      charts.Series<ExampleData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ExampleData result, _) => result.date,
        measureFn: (ExampleData result, _) => result.amounts,
        labelAccessorFn: (datum, index) => datum.amounts.toString(),
        data: data,
      )
    ];
  }
}

class ExampleData {
  final String date;
  final int amounts;

  ExampleData(this.date, this.amounts);
}
