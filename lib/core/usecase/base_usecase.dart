import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/error/failuer.dart';

import '../../features/weather/domain/entities/weather.dart';

abstract class BaseUseCase<T, Paramter> {
  Future<Either<Failuer, T>> call(Paramter paramter);

}

class NoParameter extends Equatable {

  const NoParameter();

  @override
  List<Object> get props => [];
}