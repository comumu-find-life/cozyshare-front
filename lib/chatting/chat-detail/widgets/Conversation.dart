import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../mode/User.dart';
import '../mode/message_model.dart';

class Conversation extends StatelessWidget {

  final User user;

  Conversation(this.user);
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, int index) {
          final message = messages[index];

          bool isMe = message.sender?.id == currentUser.id;

          return _buildMessage(isMe, messages[index].text, context);
        });
  }



  Widget _buildMessage(bool isMe,String? text ,BuildContext context){
    TextStyle bodyTextMessage = TextStyle(
        fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.w600);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMe)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/test/man.png"),
                ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                decoration: BoxDecoration(
                    color: isMe ? Color(0xffFCAAAB) : Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(isMe ? 12 : 0),
                      bottomRight: Radius.circular(isMe ? 0 : 12),
                    )),
                child: Text(
                  // messages[index].text,
                  "$text",
                  style: bodyTextMessage.copyWith(
                      color: isMe ? Colors.white : Colors.grey[800]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (!isMe)
                  SizedBox(
                    width: 40,
                  ),

                HintText2("24.02.14", kGrey200Color),

                // Text(
                //   "24.04.13",
                //   style: TextStyle(color: kGrey200Color),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
