import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Score extends Equatable {
  final String id;
  final String userName;
  final String city;
  final int totalAttempts;

  Score({
    required this.userName,
    required this.city,
    required this.totalAttempts,
  }) : id = const Uuid().v7();

  @override
  List<Object?> get props => [id];
}
