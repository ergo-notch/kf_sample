import 'package:equatable/equatable.dart';

class NetworkErrorModel extends Equatable {
  final int? statusCode;
  final String? statusMessage;

  const NetworkErrorModel({this.statusCode, this.statusMessage});

  @override
  List<Object?> get props => [statusCode, statusMessage];
}
