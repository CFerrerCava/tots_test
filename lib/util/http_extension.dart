import 'package:http/http.dart';
import 'package:tots_test/models/handle_api_error.dart';

extension ResponseExtension on Response {
  bool get isCompleted => statusCode == Status.completed.statusCode;

  bool get isCreated => statusCode == Status.created.statusCode;

  bool get isError => statusCode == Status.error.statusCode;
}
