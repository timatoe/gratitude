part of 'record_cubit.dart';

abstract class RecordState extends Equatable {
  const RecordState();
}

class RecordLoading extends RecordState {
  @override
  List<Object> get props => [];
}

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