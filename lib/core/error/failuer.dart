import 'package:equatable/equatable.dart';

abstract class Failuer extends Equatable {
  final String erorrMessage;

  Failuer({required this.erorrMessage});

  @override
  List<Object> get props => [erorrMessage];
}

class ServerFailuer extends Failuer {
  ServerFailuer({required super.erorrMessage});

}