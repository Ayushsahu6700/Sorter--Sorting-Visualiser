import 'dart:async';

import 'package:flutter/foundation.dart';

class SortingProvider with ChangeNotifier {
  List<int> _numbers = [95, 5, 2, 55, 6, 57, 8, 9, 5, 2, 1, 5];
  List<int> get numbers => _numbers;
  int _key = -1;
  int _minNum = -1;
  int _sorted = 1000;
  int get sorted => _sorted;
  int get key => _key;
  int get minNum => _minNum;
  int _n1 = 101, _n2 = 101;
  int get n1 => _n1;
  int get n2 => _n2;
  void reset() {
    _numbers = [];
    _key = -1;
    _minNum = -1;
    _sorted = 1000;
    _n1 = 101;
    _n2 = 101;
    notifyListeners();
  }

  void addNumbers(List<int> nums) {
    _numbers = nums;
    notifyListeners();
  }

  void setKey(int num) {
    _key = num;
  }

  void setSorted(int num) {
    _sorted = num;
  }

  void setMinInd(int num) {
    _minNum = num;
  }

  void set(int num1, int num2) {
    _n1 = num1;
    _n2 = num2;
  }

  void insertionSort() async {
    for (int j = 1; j < _numbers.length; j++) {
      int key = _numbers[j];
      setKey(key);
      int i = j - 1;

      while (i >= 0 && _numbers[i] > key) {
        set(i, i + 1);
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));

        _numbers[i + 1] = _numbers[i];
        i = i - 1;
        _numbers[i + 1] = key;
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
      }
    }
    set(101, 101);
    setKey(-1);
    setSorted(1);
    notifyListeners();
  }

  void selectionSort() async {
    var n = _numbers.length;
    for (var i = 0; i < n - 1; i++) {
      var index_min = i;
      for (var j = i + 1; j < n; j++) {
        if (_numbers[j] < _numbers[index_min]) {
          index_min = j;
          setMinInd(_numbers[j]);
        }
      }
      if (index_min != i) {
        set(i, index_min);
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
        var temp = _numbers[i];
        _numbers[i] = _numbers[index_min];
        _numbers[index_min] = temp;
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
      }
    }
    set(101, 101);
    setMinInd(-1);
    setSorted(1);
    notifyListeners();
  }

  void bubbleSort() async {
    int lengthOfArray = _numbers.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (_numbers[j] > _numbers[j + 1]) {
          set(j, j + 1);
          notifyListeners();
          await Future.delayed(Duration(seconds: 1));
          int temp = _numbers[j];
          _numbers[j] = _numbers[j + 1];
          _numbers[j + 1] = temp;
          notifyListeners();
          await Future.delayed(Duration(seconds: 1));
        }
      }
    }
    set(101, 101);
    setSorted(1);
    notifyListeners();
  }
}
