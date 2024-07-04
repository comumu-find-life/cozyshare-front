// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'DirectMessageDto.dart';
// import 'chatservice.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   late WebSocketService _webSocketService;
//
//   @override
//   void initState() {
//     super.initState();
//     _webSocketService = WebSocketService('ws://10.0.2.2:8080/ws/chat');
//   }
//
//   @override
//   void dispose() {
//     _webSocketService.dispose();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       final message = DirectMessageDto(
//         senderId: 1, // 실제 사용자 ID로 대체
//         receiverId: 2, // 실제 수신자 ID로 대체
//         message: _controller.text,
//         roomId: 1, // 실제 방 ID로 대체
//       );
//
//       _webSocketService.sendMessage(jsonEncode(message.toJson()));
//       _controller.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Room'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: StreamBuilder(
//               stream: _webSocketService.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final message = jsonDecode(snapshot.data as String);
//                   final dm = DirectMessageDto.fromJson(message);
//                   return ListTile(
//                     title: Text(dm.message),
//                     subtitle: Text('From: ${dm.senderId}'),
//                   );
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(labelText: 'Send a message'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }