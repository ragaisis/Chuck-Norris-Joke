import 'package:chuck_norris_joke/data/remote/network_exception.dart';

String getExceptionMessage(error) {
  if (error is NetworkException) {
    return "Service is not available. Please try later";
  } else if (error is ParsingException) {
    return "Parsing issues. Please contact developer";
  } else
    return "Something went wrong";
}