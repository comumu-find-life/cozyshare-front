import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

class HomeImageController extends GetxController {
  //집 이미지
  RxList _imageList = [].obs;
  Rx<bool> _isRegisterImage = false.obs;

  void registerImage() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile> resultList = [];
    resultList = await imagePicker.pickMultiImage();
    _imageList.value = resultList;
    if (resultList.length > 0) {
      _isRegisterImage.value = true;
    }
  }

  List<String> extractImageUrls(){
    List<String> paths = [];
    for(int i = 0; i<_imageList.length; i++){
      paths.add(_imageList[i].path);
    }


    return paths;
  }

  List get images => _imageList.value;

  RxList get imageList => _imageList;

  bool get isRegisterImage => _isRegisterImage.value;
}
