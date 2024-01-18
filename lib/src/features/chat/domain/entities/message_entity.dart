import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int id;
  final String message;
  final bool isSentByUser;
  final DateTime createdAt;
  final DateTime? readAt;

  const MessageEntity({
    required this.id,
    required this.message,
    required this.isSentByUser,
    required this.createdAt,
    required this.readAt,
  });

  @override
  List<Object?> get props => [
        id,
        message,
        isSentByUser,
        createdAt,
        readAt,
      ];
}
