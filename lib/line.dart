import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class LinePage extends StatelessWidget {
  const LinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Line Chart'),
        Expanded(
            child: charts.TimeSeriesChart(
          _createSampleData(),
          domainAxis: const charts.DateTimeAxisSpec(
            renderSpec: charts.SmallTickRendererSpec<DateTime>(
              labelStyle: charts.TextStyleSpec(
                fontSize: 10,
                color: charts.MaterialPalette.black,
              ),
            ),
          ),
        )),
      ],
    );
  }

  static List<charts.Series<ExampleData, DateTime>> _createSampleData() {
    final data = [
      ExampleData(DateTime(2023, 01, 01), 256),
      ExampleData(DateTime(2023, 01, 08), 557),
      ExampleData(DateTime(2023, 01, 15), 2341),
      ExampleData(DateTime(2023, 01, 22), 2156),
      ExampleData(DateTime(2023, 01, 29), 3849),
      ExampleData(DateTime(2023, 02, 05), 4064),
      ExampleData(DateTime(2023, 02, 12), 2500),
      ExampleData(DateTime(2023, 02, 19), 554),
      ExampleData(DateTime(2023, 02, 26), 1438),
      ExampleData(DateTime(2023, 03, 05), 3686),
      ExampleData(DateTime(2023, 03, 12), 3154),
      ExampleData(DateTime(2023, 03, 19), 2573),
      ExampleData(DateTime(2023, 03, 26), 2661),
      ExampleData(DateTime(2023, 04, 02), 1307),
      ExampleData(DateTime(2023, 04, 09), 3992),
      ExampleData(DateTime(2023, 04, 16), 147),
      ExampleData(DateTime(2023, 04, 23), 3707),
      ExampleData(DateTime(2023, 04, 30), 1307),
      ExampleData(DateTime(2023, 05, 07), 1656),
      ExampleData(DateTime(2023, 05, 14), 1290),
      ExampleData(DateTime(2023, 05, 21), 3130),
      ExampleData(DateTime(2023, 05, 28), 3992),
      ExampleData(DateTime(2023, 06, 04), 147),
      ExampleData(DateTime(2023, 06, 11), 3707),
      ExampleData(DateTime(2023, 06, 18), 1307),
      ExampleData(DateTime(2023, 06, 25), 1656),
      ExampleData(DateTime(2023, 07, 02), 1290),
      ExampleData(DateTime(2023, 07, 09), 3130),
      ExampleData(DateTime(2023, 07, 16), 3992),
    ];

    return [
      charts.Series<ExampleData, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ExampleData result, _) => result.date,
        measureFn: (ExampleData result, _) => result.amounts,
        labelAccessorFn: (datum, index) => datum.amounts.toString(),
        data: data,
      ),
      charts.Series<ExampleData, DateTime>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (ExampleData result, _) => result.date,
        measureFn: (ExampleData result, _) => result.amounts / 10,
        labelAccessorFn: (datum, index) => datum.amounts.toString(),
        data: data,
      )
    ];
  }
}

class ExampleData {
  final DateTime date;
  final int amounts;

  ExampleData(this.date, this.amounts);
}
