import 'package:flutter/material.dart';

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
            CircleAvatar(
              radius: 30,
              child:
              Image.network('https://pbs.twimg.com/media/ETF0IfwWkAEPlas.jpg'),
            ),
            SizedBox(width: 15),
            Text('Jonas',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              MessageContainer( content: 'Olá, qual o preço do Alface?', isSender: true),
                MessageContainer( content: 'A Alface está 5 reais ', isSender: false),
                MessageContainer( content: 'Ainda há 4 unidades para hoje', isSender: false),
                MessageContainer( content: 'Opa!, eu gostaria de 2 Por Favor', isSender: true),
                MessageContainer( content: 'Das 14 as 15 ?', isSender: true),
                MessageContainer( content: 'Sim', isSender: false),
            ],),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()=> null, child: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  MessageContainer({ required this.content, required this.isSender});
  final String content;
  final bool isSender;

  final BorderRadius senderBorder = BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 6,
            borderRadius:
            isSender ? senderBorder : senderBorder.copyWith(topLeft: Radius.zero, topRight: Radius.circular(15)),
            color: isSender ? Colors.lightGreen : Colors.lightGreen[800],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                content,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
