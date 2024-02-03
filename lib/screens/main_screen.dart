import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final CounterModel _count = CounterModel();

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _count.addByTime();
      },
    );
    super.initState();
  }

  void _incrementCounter() {
    _count.increment();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setModalState) {
            if (index == 0) {
              return SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              // 自動１
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _count.count < 10 ||
                                            _count.autoLevel == 100
                                        ? null
                                        : () {
                                            _count.autoLevelUp();
                                          },
                                    child: ListenableBuilder(
                                      listenable: _count,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '自動 レベル：${_count.autoLevel}'),
                                              Text(
                                                  '${_count.autoIncrement}/1秒'),
                                              Text("コスト：${_count.count}/10"),
                                            ]);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // 自動２
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _count.count < 100 ||
                                            _count._auto2Level == 100
                                        ? null
                                        : () {
                                            _count.auto2LevelUp();
                                          },
                                    child: ListenableBuilder(
                                      listenable: _count,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '自動2 レベル：${_count.auto2Level}'),
                                              Text(
                                                  '${_count.auto2Increment}/1秒'),
                                              Text("コスト：${_count.count}/10"),
                                            ]);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: _count.count < 100000000
                                          ? null
                                          : () {},
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '自動',
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )));
            } else if (index == 1) {
              return SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _count.count < 10 ||
                                            _count.tapLevel == 100
                                        ? null
                                        : () {
                                            _count.tapLevelUp();
                                          },
                                    child: ListenableBuilder(
                                      listenable: _count,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'タップ レベル：${_count.tapLevel}'),
                                              Text('${_count.tapIncrement}/1秒'),
                                              Text("コスト：${_count.count}/10"),
                                            ]);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: _count.count < 100000000
                                          ? null
                                          : () {},
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'そうび',
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: _count.count < 100000000
                                          ? null
                                          : () {},
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'そうび',
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )));
            } else if (index == 2) {
              return Center(
                  child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CloseButton(
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Text("index：$index"),
                ],
              ));
            } else {
              return SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: CloseButton(
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ListenableBuilder(
                          listenable: _count,
                          builder: (BuildContext context, Widget? child) {
                            return Column(children: [
                              Text(
                                "現在のカウント数：${_count.count}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "１タップで追加される数：${_count.tapIncrement}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "1秒ごとに追加される数：${_count.autoIncrement + _count.auto2Increment}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "自動レベル：${_count.autoLevel}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "自動2レベル：${_count.auto2Level}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "タップレベル：${_count.tapLevel}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              ElevatedButton(
                                child: const Text("All reset!!"),
                                onPressed: () {
                                  _count.allReset();
                                },
                              ),
                            ]);
                          },
                        ),
                      )
                    ],
                  ));
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: _count,
          builder: (BuildContext context, Widget? child) {
            return Text('${widget.title} ：${_count.count}');
          },
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListenableBuilder(
                listenable: _count,
                builder: (BuildContext context, Widget? child) {
                  return Text('${_count.count}');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "アイテム",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "そうび"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "ミッション"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "ステータス"),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
