import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hola trafi', fromWho: FromWho.me),
    Message(text: 'Ya termino la pelea?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(fromWho: FromWho.me, text: text);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      hisReplay();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> hisReplay() async {
    final hisMessage = await getYesNoAnswer.getAnswer();
    messages.add(hisMessage);
    notifyListeners();

    moveScrollToBottom();
  }
}
