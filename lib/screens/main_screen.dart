import 'dart:async';

import '../models/counter_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final CounterModel count;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late CounterModel _count; // この時点では初期値が設定されないので late

  @override
  void initState() {
    _count = widget.count;
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
                                            _count.auto2Level == 100
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
