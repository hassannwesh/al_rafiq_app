import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:equatable/equatable.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarSuccess extends AzkarState {
  final List<AzkarModel> azkar;

  const AzkarSuccess(this.azkar);

  @override
  List<Object> get props => [azkar];
}

class AzkarFailure extends AzkarState {
  final String errMessage;

  const AzkarFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
