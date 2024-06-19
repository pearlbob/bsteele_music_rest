import 'package:bsteele_music_lib/app_logger.dart';
import 'package:bsteele_music_rest/handlers/main_song_list.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/test.dart';

import '../bin/server.dart';

final host = 'http://0.0.0.0:$port';

void main() {
  test('main song list', () async {
    final router = Router();
    MainSongListHandler().register(router);

    var songId = 'Song_bob_by_bob';
    Response response = await router.call(Request('GET', Uri.parse('$host/mainSongList/$songId')));
    expect(response.statusCode, 200);
    var responseAsString = await response.readAsString();
    logger.i('responseAsString: "$responseAsString"');
    expect(responseAsString, 'song list here: "$songId"');
  });
}
