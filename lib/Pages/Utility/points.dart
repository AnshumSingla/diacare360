import 'package:collection/collection.dart';

class pointxy {
  final double bg;
  final int time;
  pointxy({required this.bg, required this.time});
}

List<pointxy> get dayPointData {
  final data = <double>[
    2,
    5,
    3,
    6,
    3,
    2,
  ];
  return data
      .mapIndexed(((index, element) =>
          pointxy(bg: index.toDouble(), time: element.toInt())))
      .toList();
}

List<pointxy> get weekPointData {
  final data = <double>[
    5,
    1,
    4,
    6,
    2,
    4,
  ];
  return data
      .mapIndexed(((index, element) =>
          pointxy(bg: index.toDouble(), time: element.toInt())))
      .toList();
}

List<pointxy> get monthPointData {
  final data = <double>[
    7,
    4,
    6,
    8,
    1,
    3,
  ];
  return data
      .mapIndexed(((index, element) =>
          pointxy(bg: index.toDouble(), time: element.toInt())))
      .toList();
}
