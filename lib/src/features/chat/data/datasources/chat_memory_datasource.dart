import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

class ChatMemoryDataSource implements ChatDataSource {
  static final chats = <ChatEntity>[
    ChatEntity(
      id: 1,
      name: 'Хан Соло',
      lastMessage: MessageEntity(
        id: 1,
        message: 'Да пребудет с тобой Сила.',
        isSentByUser: false,
        createdAt: DateTime.parse('2022-01-23 21:43:00'),
        readAt: null,
      ),
    ),
    ChatEntity(
      id: 2,
      name: 'Морфеус',
      lastMessage: MessageEntity(
        id: 1,
        message: 'Ты веришь в судьбу, Нео?',
        isSentByUser: false,
        createdAt: DateTime.parse('2022-01-23 21:43:00'),
        readAt: null,
      ),
    ),
  ];

  @override
  Future<List<ChatEntity>> fetchChats() async {
    return chats;
  }

  @override
  Future<ChatEntity> fetchChat(int chatId) async {
    return chats.firstWhere((chat) => chat.id == chatId);
  }

  @override
  Future<List<MessageEntity>> fetchMessages(int chatId) async {
    return [
      (await fetchChat(chatId)).lastMessage!,
    ];
  }
}
