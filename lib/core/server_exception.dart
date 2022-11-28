import 'package:equatable/equatable.dart';

class ServerException implements Exception {
  late final Equatable? response;

  ServerException({
    this.response,
  });
}
