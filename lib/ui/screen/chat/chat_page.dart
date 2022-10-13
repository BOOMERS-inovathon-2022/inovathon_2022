import 'package:flutter/material.dart';

import '../../theme/custom_router.dart';
import '../seller_profile/seller_profile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => CustomRouter.pushPage(
                context,
                const SellerProfile(
                  seller: null,
                ),
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://i1.sndcdn.com/artworks-lq81iGn8UqOkdpTt-IawAKw-t500x500.jpg', //TODO imagem de perfil do vendedor
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Text(
              'Jonas', //TODO nome do vendedor
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  MessageContainer(
                      content: 'Olá, qual o preço da Alface?', isSender: true),
                  MessageContainer(
                      content: 'A Alface está 5 reais!', isSender: false),
                  MessageContainer(
                      content: 'Ainda há 4 unidades para hoje.',
                      isSender: false),
                  MessageContainer(
                      content: 'Opa, eu gostaria de 2 unidades por favor.',
                      isSender: true),
                  MessageContainer(content: 'Das 14 as 15?', isSender: true),
                  MessageContainer(content: 'Sim', isSender: false),
                  MessageContainer(content: 'Obrigada!', isSender: true),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => null,
                  child: const Icon(
                    Icons.send,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  MessageContainer({required this.content, required this.isSender});

  final String content;
  final bool isSender;

  final BorderRadius senderBorder = const BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 6,
            borderRadius: isSender
                ? senderBorder
                : senderBorder.copyWith(
                    topLeft: Radius.zero,
                    topRight: const Radius.circular(
                      15,
                    ),
                  ),
            color: isSender ? Colors.lightGreen : Colors.lightGreen[800],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
