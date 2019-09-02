import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:singing_app/data_manager/models/note.dart';

import '../../shared.dart';

import 'dart:collection' show LinkedHashMap;

import 'package:charts_flutter/flutter.dart';


class NoteDurationScatterPlot extends StatelessWidget {
 // final List<charts.Series> seriesList;
  final List<NoteModel> notesList;
  final bool animate;

  NoteDurationScatterPlot(this.notesList, {this.animate});

  /// Creates a [ScatterPlotChart] with sample data and no transition.

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.

  /// Create random data.
  List<charts.Series<NoteData, num>> _createNoteData() {
    final random = new Random();
    final makeRadius = (int value) => (random.nextInt(value) + 2).toDouble();
    List<NoteData> data = [];
    List<int> tots=List.filled(12, 0);
    notesList.forEach((n){
      tots[notenames.indexOf(n.note)]+=n.samples;
      data.add(new NoteData(notenames.indexOf(n.note), n.samples, 6.0));
    });
    int i=0;
    tots.forEach((t){
      data.add(new NoteData(i, t, 10.0));
      i+=1;
    });


    final maxMeasure = 12;

    return [
      new charts.Series<NoteData, int>(
        id: 'Notes',
        colorFn: (NoteData sales, _) {
          // Color bucket the measure column value into 3 distinct colors.
          final bucket = sales.year / maxMeasure;

          if (maj.contains(sales.year)) {
            return charts.MaterialPalette.green.shadeDefault;
          } else {
            return charts.MaterialPalette.blue.shadeDefault;
          }
        },
        domainFn: (NoteData sales, _) => sales.year,
        measureFn: (NoteData sales, _) => sales.sales,
        radiusPxFn: (NoteData sales, _) => sales.radius,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(_createNoteData(), animate: animate);
  }

}


class NoteData {
  final int year;
  final int sales;
  final double radius;

  NoteData(this.year, this.sales, this.radius);
}











class SimpleScatterPlotChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleScatterPlotChart(this.seriesList, {this.animate});

  /// Creates a [ScatterPlotChart] with sample data and no transition.
  factory SimpleScatterPlotChart.withSampleData() {
    return new SimpleScatterPlotChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory SimpleScatterPlotChart.withRandomData() {
    return new SimpleScatterPlotChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<LinearSales, num>> _createRandomData() {
    final random = new Random();

    final makeRadius = (int value) => (random.nextInt(value) + 2).toDouble();

    final data = [
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
      new LinearSales(random.nextInt(100), random.nextInt(100), makeRadius(6)),
    ];

    final maxMeasure = 100;

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (LinearSales sales, _) {
          // Color bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5, 3.0),
      new LinearSales(10, 25, 5.0),
      new LinearSales(12, 75, 4.0),
      new LinearSales(13, 225, 5.0),
      new LinearSales(16, 50, 4.0),
      new LinearSales(24, 75, 3.0),
      new LinearSales(25, 100, 3.0),
      new LinearSales(34, 150, 5.0),
      new LinearSales(37, 10, 4.5),
      new LinearSales(45, 300, 8.0),
      new LinearSales(52, 15, 4.0),
      new LinearSales(56, 200, 7.0),
    ];

    final maxMeasure = 300;

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        // Providing a color function is optional.
        colorFn: (LinearSales sales, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}