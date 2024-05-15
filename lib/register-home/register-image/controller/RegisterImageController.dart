import 'package:get/get.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

class HomeImageController extends GetxController {
  //집 이미지
  RxList _imageList = [].obs;
  Rx<bool> _isRegisterImage = false.obs;

  void registerImage() async {
    List<Asset> resultList = [];
    resultList = await MultiImagePicker.pickImages();
    _imageList.value = resultList;
    if (resultList.length > 0) {
      _isRegisterImage.value = true;
    }
  }

  List get images => _imageList.value;

  RxList get imageList => _imageList;

  bool get isRegisterImage => _isRegisterImage.value;
}
