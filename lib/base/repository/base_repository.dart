import 'package:http/http.dart';
import 'package:pf_flutter_template/base/custom_exception.dart';
import 'package:pf_flutter_template/base/server_response.dart';

abstract class BaseRepository {
  final Client client;

  BaseRepository(this.client);

  T getData<T>(Response response) {
    if (response.statusCode == 200) {
      ServerResponse<T> serverResponse = ServerResponse.fromResponse(response.bodyBytes);
      if (serverResponse.status == 200) {
        return serverResponse.data!;
      }
      throw ServerResponseException(serverResponse.message ?? "server error");
    }
    throw UnknownServerException("unknown server error");
  }
  void checkResponse(Response response) {
    if (response.statusCode == 200) {
      ServerResponse serverResponse = ServerResponse.fromResponse(response.bodyBytes);
      if (serverResponse.status == 200) {
        return;
      }
      throw ServerResponseException(serverResponse.message ?? "server error");
    }
    throw UnknownServerException("unknown server error");
  }
}
