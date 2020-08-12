part of 'record_bloc.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();

  @override
  List<Object> get props => [];
}

class GetRecords extends RecordEvent {}

class RecordAdded extends RecordEvent {
  final Record record;

  const RecordAdded(this.record);

  @override
  List<Object> get props => [record];

  @override
  String toString() => 'TodoAdded { todo: $record }';
}