import 'dart:io';

import 'package:bsteele_music_rest/handlers/main_song_list.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router();
const String port = '8081';


Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  _router.get('/', _rootHandler);
  _router.get('/echo/<message>', _echoHandler);
  MainSongListHandler().register(_router);

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final serverPort = int.parse(Platform.environment['PORT'] ?? port);
  final server = await serve(handler, ip, serverPort);
  print('Server listening on port ${server.port}');
}
