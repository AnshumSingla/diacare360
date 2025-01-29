class PointXY {
  final double bg;
  final String time;

  PointXY({required this.bg, required this.time});
}

List<double> points = [];
// Fixed list of times, which repeats as required
final List<String> timeList = <String>['12 am', '3 am', '6 am', '9 am', '12 pm', '3 pm', '6 pm', '9 pm'];

void getData(double value) {
  if (points.length < timeList.length) {
    points.add(value);
  }
}

List<PointXY> get dayPointData {
  // Ensure that points list is less than or equal to the size of timeList
  int dataSize =
      points.length > timeList.length ? timeList.length : points.length;

  return List.generate(dataSize, (index) {
    return PointXY(
      bg: points[index],
      time: timeList[index],
    );
  });
}

List<PointXY> get weekPointData {
  int dataSize =
      points.length > timeList.length ? timeList.length : points.length;

  return List.generate(dataSize, (index) {
    return PointXY(
      bg: points[index],
      time: timeList[index],
    );
  });
}

List<PointXY> get monthPointData {
  int dataSize =
      points.length > timeList.length ? timeList.length : points.length;

  return List.generate(dataSize, (index) {
    return PointXY(
      bg: points[index],
      time: timeList[index],
    );
  });
}
