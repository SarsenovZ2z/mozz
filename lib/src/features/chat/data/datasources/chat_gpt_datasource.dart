import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mozz/src/common/data/datasources/remote_datasource.dart';
import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/utils/http/api.dart';

class ChatGptDataSource extends RemoteDataSource implements ChatDataSource {
  static final chats = <ChatEntity>[
    ChatEntity(
      id: 1,
      name: 'Мастер Йода',
      lastMessage: MessageEntity(
        id: 1,
        message: 'Да пребудет с тобой сила.',
        isSentByUser: false,
        createdAt: DateTime.now(),
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
        createdAt: DateTime.now(),
        readAt: null,
      ),
    ),
  ];

  const ChatGptDataSource({
    required super.api,
  });

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

  @override
  Future<String> sendMessage({
    required int chatId,
    required String message,
    List<MessageEntity> context = const [],
  }) async {
    final person = chatId == 1
        ? 'Мастер Йода из Звездных войн'
        : 'Морфеус из фильма Матрица.';
    final messages = [
      {
        "role": "system",
        "content": "Ты собеседник. Старайся поддерживать диалог как можно дольше. Отвечай короткими предложениями. Твоя задача отвечать как $person"
      },
      ...context.reversed.map((message) => {
            "role": message.isSentByUser ? "user" : "assistant",
            "content": message.message,
          })
    ];

    final response = await api
        .usingAccessToken(dotenv.get('CHAT_GPT_KEY'))
        .request(
      HTTPMethod.post,
      'https://api.openai.com/v1/chat/completions',
      data: {
        "model": "gpt-3.5-turbo",
        "temperature": 1.0,
        "messages": messages
      },
    );

    return response.data['choices'][0]['message']['content'];
  }
}
