import 'package:equatable/equatable.dart';

class ErorrModel extends Equatable {

  final ErorrMessage erorr;

  const ErorrModel({required this.erorr});

  factory ErorrModel.fromJson(Map<String, dynamic>json)=>
      ErorrModel(erorr: ErorrMessage.fromJson(json['error']));

  @override
  List<Object> get props => [erorr];
}

class ErorrMessage extends Equatable {
  final String message;

  @override
  List<Object> get props => [message];

  const ErorrMessage({required this.message});

  factory ErorrMessage.fromJson(Map<String, dynamic> json) =>
      ErorrMessage(message: json['message']);
}
