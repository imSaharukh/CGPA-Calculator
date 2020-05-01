import 'package:flutter/foundation.dart';

class DataArrays with ChangeNotifier {
  int _i = 3;
  List _counter = [0, 1, 2];
  List get counter => _counter;
  void plus() {
    _counter.add(_i);
    _i++;
    notifyListeners();
    print(_counter);
  }

  void delete(int index) {
    _counter.removeAt(index);
    notifyListeners();
    print(_counter);
  }
}

class FullDetails {
  Map<int, String> course = {0: 'saharukh'};
  Map<int, double> gpa = {0: 1};
  Map<int, double> credits = {0: 1};
}
