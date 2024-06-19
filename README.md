A server app built using [Shelf](https://pub.dev/packages/shelf),

This sample code handles HTTP GET requests to `/` and `/echo/<message>`

# Running the sample

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8081
```

And then from a second terminal:
```
$ curl http://localhost:8081
Hello, World!
$ curl http://localhost:8081/echo/I_love_Dart
I_love_Dart
```

