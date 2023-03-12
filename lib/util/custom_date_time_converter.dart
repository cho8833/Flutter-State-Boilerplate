import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    // TODO: implement fromJson
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(json);
  }
}