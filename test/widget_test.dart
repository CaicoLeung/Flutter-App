// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/test.dart' show setUpAll, tearDownAll, group, expect, test;
import 'package:flutter_driver/flutter_driver.dart' as flutterDrivier show FlutterDriver, find, TimelineSummary;
import 'package:flutter_test/flutter_test.dart' show testWidgets, WidgetTester, findsOneWidget, findsNothing, find;
import 'package:my_app/main.dart';
import 'package:my_app/Counter.dart' show Counter;

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });
    test('value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test('value should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
  group('Scrollable App', () {
    flutterDrivier.FlutterDriver driver;
    setUpAll(() async {
      driver = await flutterDrivier.FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('verifies the list contains a specific item', () async {
      final listFinder = flutterDrivier.find.byValueKey('long_list');
      final itemFinder = flutterDrivier.find.byValueKey('item_50_text');
      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(listFinder, itemFinder, dyScroll: -300.0);
        expect(await driver.getText(itemFinder), 'Item 50');
      });
      final summary = new flutterDrivier.TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('scrolling_summary', pretty: true);
      summary.writeTimelineToFile('scrolling_summary', pretty: true);
    });
  });

  group('Counter App', () {
    final counterTextFinder = flutterDrivier.find.byValueKey('counter');
    final buttonFiner = flutterDrivier.find.byValueKey('counter');
    flutterDrivier.FlutterDriver driver;
    setUpAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), '0');
    });
    test('increments the counter', () async {
      await driver.tap(buttonFiner);
      expect(await driver.getText(counterTextFinder), '1');
    });
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  setUpAll(() async {
    print('TEST:::::::');
    // 提供一个临时文件夹作为工作空间
    final directory = await Directory.systemTemp.createTemp();
    // 为 path_provider 插件提供一个模拟的 MethodChannel
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      // 如果您要获取应用的 Documents 目录，请返回测试环境中的临时目录的路径
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
    const MethodChannel('plugins.flutter.io/shared_preferences').setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
  });
}
