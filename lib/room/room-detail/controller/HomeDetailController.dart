import 'package:get/get.dart';
import 'package:home_and_job/chatting/api/ChatApi.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';
import 'package:home_and_job/model/chat/DirectMessageApplicationDto.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/room/api/RoomApi.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDetailController extends GetxController {
  late HomeInformationResponse? homeInformationResponse;
  Rx<bool> _isFavorite = false.obs;


  Future<bool> loadHomeInformation(int? homeId) async{
    String? diskResponse = await DiskDatabase().getFavoriteHomeId(homeId.toString());

    if(diskResponse == null){
      _isFavorite.value = false;
    }else{
      _isFavorite.value = true;
    }

    homeInformationResponse = (await RoomApi().findById(homeId!))!;

    if(homeInformationResponse != null){
      return true;
    }
    return false;
  }

  void sendMessage()async{
    Get.to(() => ChatDetailView(int.parse(homeInformationResponse!.providerId!), homeInformationResponse!.homeId!));
    // int receiverId = int.parse(homeInformationResponse!.providerId!);
    // int? roomId = homeInformationResponse?.homeId;
    // var directMessageApplicationDto = DirectMessageApplicationDto(message: '', receiverId: receiverId, roomId: roomId!);
    // await ChatApi().sendDm(directMessageApplicationDto);
  }

  void checkFacorite(int? homeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList("homeId");
    if (stringList!.contains(homeId.toString())) {
      _isFavorite?.value = true;
    } else {
      _isFavorite?.value = false;
    }
    print(stringList);
  }

  void ontapFavorite(int? homeId) async {

    if(_isFavorite.value == false){
      await DiskDatabase().addFavoriteHomeId(homeId.toString());
      _isFavorite.value = true;
    }else{
      await DiskDatabase().removeFavoriteHomeId(homeId.toString());
      _isFavorite.value = false;
    }



  }

  bool get isFavorite => _isFavorite.value;
}
