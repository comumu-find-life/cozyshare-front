

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/api/ChatApi.dart';

import '../../../model/chat/response/DirectMessageRoomListDto.dart';

class ChattingController extends GetxController {
  TextEditingController _filterController = TextEditingController();
  List<DirectMessageRoomListDto> _chatItems = [];

  Future<bool> loadAllDmList() async {
    _chatItems = await ChatApi().loadDmList();
    return true;
  }


  List<DirectMessageRoomListDto> get chatItems => _chatItems;

  TextEditingController get filterController => _filterController;
}