import 'dart:io';

import 'package:bsteele_music_lib/app_logger.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import '../bin/server.dart';

void main() {
  final host = 'http://0.0.0.0:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;
  });

  tearDown(() => p.kill());

  test('Root', () async {
    final response = await get(Uri.parse('$host/'));
    expect(response.statusCode, 200);
    expect(response.body, 'Hello, World!\n');
  });

  test('Echo', () async {
    final response = await get(Uri.parse('$host/echo/hello'));
    expect(response.statusCode, 200);
    expect(response.body, 'hello\n');
  });

  test('404', () async {
    final response = await get(Uri.parse('$host/foobar'));
    expect(response.statusCode, 404);
  });

  test('main song list', () async {
    final response = await get(Uri.parse('$host/mainSongList/Song_bob_by_bob'));
    expect(response.statusCode, 200);
    expect(response.body, 'song list here: "Song_bob_by_bob"');
    logger.i('done');
  });
}
