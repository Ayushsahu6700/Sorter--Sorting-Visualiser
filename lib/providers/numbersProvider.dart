import 'package:flutter/foundation.dart';

class NumbersProvider with ChangeNotifier {
  List<int> _numbers = [];
  String _curnum = "";
  String get curnum => _curnum;

  List<int> get numbers => _numbers;
  void addNum(int num) {
    _numbers.add(num);
    notifyListeners();
  }

  void curNum(String val) {
    _curnum = val;
    notifyListeners();
  }

  void reset() {
    _numbers = [];
    _curnum = "";
    notifyListeners();
  }
}
