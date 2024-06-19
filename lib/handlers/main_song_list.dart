import 'package:bsteele_music_lib/app_logger.dart';
import 'package:bsteele_music_lib/songs/song.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'bsteele_music_handler.dart';

class MainSongListHandler extends BsteeleMusicHandler {
  MainSongListHandler()
      : super('/mainSongList/<search>', (Request request) {
          logger.i('MainSongListHandler: ${request.context}');
          return Response.ok('song list here: "${request.params['search']}"');
        });

  Song? song;
}
