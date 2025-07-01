import 'package:chat_ecu911/domain/models/message.dart';

abstract class MessagesRepository {
  // funcion para enviar mensajes y gaurdar en la base de datos
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentyBy,
  );

  // Obtener la lista de mensajes del chat
  Stream<List<Message>> getMessages(String chatId);
}
