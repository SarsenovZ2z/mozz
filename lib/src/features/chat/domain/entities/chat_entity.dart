import 'package:equatable/equatable.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

class ChatEntity extends Equatable {
  final int id;
  final String name;
  final MessageEntity? lastMessage;

  const ChatEntity({
    required this.id,
    required this.name,
    required this.lastMessage,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastMessage,
      ];
}
