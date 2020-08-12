part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordLoading extends RecordState {}

class RecordLoadedSuccess extends RecordState {
  final List<Record> records;
  const RecordLoadedSuccess(this.records);

  @override
  List<Object> get props => [records];
}

class RecordLoadedError extends RecordState {
  final String message;
  const RecordLoadedError(this.message);

  @override
  List<Object> get props => [message];
}
