import 'package:doodle_drops/src/core/utils/entities/responses/message_response_entity.dart';

class MessageResponse extends MessageResponseEntity {
  const MessageResponse({required super.message});
  factory MessageResponse.fromJson(Map<String, dynamic> map) {
    return MessageResponse(message: map['message'] ?? '');
  }
}
