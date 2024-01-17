class MessageEntity {
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
}
