import 'package:weather_app/core/network/erorr_model.dart';

class ServerException implements Exception{
final ErorrModel erorrModel;

ServerException({required this.erorrModel});
}