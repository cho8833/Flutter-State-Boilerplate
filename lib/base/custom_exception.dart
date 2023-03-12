class UnknownServerException implements Exception {
  final String message;

  UnknownServerException(this.message);

  @override
  String toString() => "UnknownServerException: $message";
}

class ServerResponseException implements Exception {
  final String message;

  ServerResponseException(this.message);

  @override
  String toString() => message;
}

class EmptyListException implements Exception {
  String? message;

  EmptyListException({this.message});

  @override
  String toString() => message ?? "no data";
}

class JsonParsingException implements Exception {
  String? message;

  JsonParsingException({this.message});

  @override
  String toString() {
    return message ?? "error occurred parsing json";
  }
}