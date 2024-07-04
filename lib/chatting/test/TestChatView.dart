import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../model/chat/request/DirectMessageDto.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late StompClient stompClient;
  List<DirectMessageDto> messages = [];

  @override
  void initState() {
    super.initState();
    connectToStomp();
  }

  void connectToStomp() {
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://10.0.2.2:8082/dm/websocket', // WebSocket 서버 엔드포인트
        onConnect: onStompConnected,
        onWebSocketError: (dynamic error) => print('WebSocket Error: $error'),
      ),
    );

    stompClient.activate();
  }

  void onStompConnected(StompFrame frame) {
    stompClient.subscribe(
      destination: '/sub/chat/room/1', // 채팅방 구독
      callback: (frame) {
        setState(() {
          print("DDDDD");
          print(frame.body!.runtimeType);
          print(frame.body);
          // Decode the JSON string to a Map<String, dynamic>
          Map<String, dynamic> jsonData = jsonDecode(frame.body!);

          // Use the fromJson factory to create an instance of DirectMessageDto
          DirectMessageDto message = DirectMessageDto.fromJson(jsonData);

          messages.add(message!);
        });
      },
    );
  }

  void sendMessage(String message) {
    stompClient.send(
      destination: '/pub/chat/message',
      body: json.encode({
        'senderId': 1,
        'senderName': 'User1',
        'roomId': '1',
        'receiverId': 2,
        'message': message,
      }),
    );
  }

  @override
  void dispose() {
    stompClient.deactivate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('STOMP Chat'),
      ),
      body: Column(

        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index].message),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
