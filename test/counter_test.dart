
import 'package:test/test.dart';
import 'package:my_app/Counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}