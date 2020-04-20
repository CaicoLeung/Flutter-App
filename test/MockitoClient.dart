import 'package:mockito/mockito.dart' show Mock, when;
import 'package:http/http.dart' as http;
import 'package:my_app/FetchPost.dart';
import 'package:test/test.dart';

class MockitoClient extends Mock implements http.Client {}

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client  = MockitoClient();
      when(client.get('https://jsonplaceholder.typicode.com/posts/1')).thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      expect(await fetchPost(client), const TypeMatcher<Post>());
    });
    test('throws an exception if the http call completes with an error', () async {
      final client = MockitoClient();
      when(client.get('https://jsonplaceholder.typicode.com/posts/1')).thenAnswer((_) async => http.Response('Not Fount', 404));
      expect(fetchPost(client), throwsException);
    });
  });
}
