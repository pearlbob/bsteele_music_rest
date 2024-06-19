import 'package:shelf_router/shelf_router.dart';

abstract class BsteeleMusicHandler {
  BsteeleMusicHandler(this.route, this.handler);

  register(final Router router) {
    router.get(route, handler);
  }

  Function handler;
  final String route;
}
