import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class PiePage extends StatelessWidget {
  const PiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Pie Chart'),
        Expanded(
            child: charts.PieChart(_createSampleData(),
                defaultRenderer: charts.ArcRendererConfig<String>(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                        outsideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 20,
                          lineHeight: 1.5,
                          color: charts.ColorUtil.fromDartColor(Colors.black),
                        ),
                        insideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 20,
                          lineHeight: 1.5,
                          color: charts.ColorUtil.fromDartColor(Colors.white),
                        ),
                      )
                    ]))),
      ],
    );
  }

  static List<charts.Series<ExampleData, String>> _createSampleData() {
    final data = [
      ExampleData('Incheon Airport Regional Customs', 1200),
      ExampleData('Incheon Regional Customs', 800),
      ExampleData('Pyeontaek Cutsoms', 500),
      ExampleData('Busan Regional Customs', 600),
    ];

    final sum = data.map((e) => e.amounts).reduce((a, b) => a + b);

    return [
      charts.Series<ExampleData, String>(
        id: 'Sales',
        colorFn: (datum, index) =>
            charts.MaterialPalette.blue.makeShades(data.length)[index!],
        domainFn: (ExampleData result, _) => result.customs,
        measureFn: (ExampleData result, _) => result.amounts,
        labelAccessorFn: (datum, index) =>
            '${datum.customs},\n${datum.amounts},\n${(datum.amounts / sum * 100).round()} %',
        data: data,
      )
    ];
  }
}

class ExampleData {
  final String customs;
  final int amounts;

  ExampleData(this.customs, this.amounts);
}
