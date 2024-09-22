import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../controller/ChatProviderDetailController.dart';


class ProviderInputMessageWidget extends StatefulWidget {

  ChatProviderDetailController _controller;

  ProviderInputMessageWidget(this._controller);

  @override
  State<ProviderInputMessageWidget> createState() => _ProviderInputMessageWidgetState();
}

class _ProviderInputMessageWidgetState extends State<ProviderInputMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 70.h,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [

                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget._controller.textEditingController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Please enter a message.',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      widget._controller.sendMessage();
                    },
                    child: Icon(
                      Icons.send,
                      color: kDarkBlue,
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


// // 채팅 입력 폼 위젯
// Container InputMessageWidget(ChatDetailController _controller) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     color: Colors.white,
//     height: 70.h,
//     child: Row(
//       children: [
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 14),
//             height: 50.h,
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               children: [
//
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//
//                       border: InputBorder.none,
//                       hintText: '메시지를 입력하세요.',
//                       hintStyle: TextStyle(color: Colors.grey[500]),
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   Icons.send,
//                   color: kDarkBlue,
//                 )
//               ],
//             ),
//           ),
//         ),
//
//       ],
//     ),
//   );
// }

