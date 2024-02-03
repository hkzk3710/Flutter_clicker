import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  // メインのカウント数値
  int _count = 0; // フィールドの宣言
  int get count => _count; // 読み取り専用。ゲッター関数の宣言、dartの書き方。int型の結果を返す関数を作っている
  // int count(){return _count;} と同じ
  // getterメソッドで、データの生合成を設定する
  // setterメソッドもある
  // フィールド宣言、getter宣言、setter宣言の３つで大体セット。よく書かれるので簡潔に描けるようになってる。

  // １タップで増える数値
  int _tapIncrement = 1;
  int get tapIncrement => _tapIncrement;

  // タップのレベル
  int _tapLevel = 0;
  int get tapLevel => _tapLevel;

  // 自動１で増える数値
  int _autoIncrement = 0;
  int get autoIncrement => _autoIncrement;

  // 自動１のレベル
  int _autoLevel = 0;
  int get autoLevel => _autoLevel;

  // 自動２で増える数値
  int _auto2Increment = 0;
  int get auto2Increment => _auto2Increment;

  // 自動２のレベル
  int _auto2Level = 0;
  int get auto2Level => _auto2Level;

  void increment() {
    _count += _tapIncrement;
    notifyListeners();
  }

  void tapLevelUp() {
    _count -= 10;
    _tapIncrement += 1;
    _tapLevel++;
    notifyListeners();
  }

  void autoLevelUp() {
    _count -= 10;
    _autoIncrement += 10;
    _autoLevel++;
    notifyListeners();
  }

  void auto2LevelUp() {
    _count -= 100;
    _auto2Increment += 10;
    _auto2Level++;
    notifyListeners();
  }

  void addByTime() {
    _count += (_autoIncrement + _auto2Increment);
    notifyListeners();
  }

  void allReset() {
    _count = 0;
    _tapIncrement = 1;
    _tapLevel = 0;
    _autoIncrement = 0;
    _autoLevel = 0;
    _auto2Increment = 0;
    _auto2Level = 0;
    notifyListeners();
  }
}
